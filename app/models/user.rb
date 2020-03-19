class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Userとの関連付け (1:N)の関係
  has_many :books, dependent: :destroy
  # 画像投稿機能
  attachment :profile_image

  # sign_in sig_up 名前入力設定 (空白禁止、２〜２０字以内)
  validates :name, presence: true, uniqueness: true, length: 2..20
end

