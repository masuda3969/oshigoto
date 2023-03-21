class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
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

end
