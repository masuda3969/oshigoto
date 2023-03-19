class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  #プロフィール画像
  has_one_attached :image
         
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy

end
