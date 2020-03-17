class Book < ApplicationRecord
	belongs_to :user #userモデルと関連付け
end
