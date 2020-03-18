class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Userとの関連付け (1:N)の関係
  has_many :books, dependent: :destroy
  # 画像投稿機能
  attachment :profile_image
end

