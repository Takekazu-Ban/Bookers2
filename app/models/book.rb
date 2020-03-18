class Book < ApplicationRecord
	# 1つのUserモデルとBookモデルの関連付け
	belongs_to :user

	# バリデーションチェック
	validates :title, presence: true
	validates :opinion, presence: true
end
