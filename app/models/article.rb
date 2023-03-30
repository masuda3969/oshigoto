class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :favorite
  
  validates :title, presence: true
  validates :body, presence: true
  validates :favorite, presence: { message: 'を選択してください' }
  
  
  # 引数で渡されたユーザidがLikesテーブル内に存在（exists?）するかどうかを調べる
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
  
  
end
