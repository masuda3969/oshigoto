class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         validates :last_name, presence: true
         validates :first_name, presence: true
         validates :last_name_kana, presence: true
         validates :first_name_kana, presence: true
         validates :account, presence: true
         validates :image, presence: { message: 'を選択してください' }
         validates :account, uniqueness: true
         
  #プロフィール画像
  has_one_attached :image
         
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :like, dependent: :destroy
  has_many :schedules, dependent: :destroy

  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower
  
  #フォローしたとき
  def follow(user_id)
     relationships.create(followed_id: user_id)
  end
  
  # フォローを外すとき
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
  
  # フォローしているか判定
  def following?(user)
    followings.include?(user)
  end
  
  # is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (is_deleted == false)
  end
  
  # ゲストログイン機能
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.last_name = "山田"
      user.first_name = "太郎"
      user.last_name_kana = "ヤマダ"
      user.first_name_kana = "タロウ"
      user.account = "ゲスト"
      user.image.attach(io: File.open(Rails.root.join("app/assets/images/no_image.jpg")), filename: "no_image.jpg")
    end
  end


end
