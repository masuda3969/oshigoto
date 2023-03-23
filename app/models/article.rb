class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :favorite
  
  
  # 引数で渡されたユーザidがLikesテーブル内に存在（exists?）するかどうかを調べる
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
  
  
end
