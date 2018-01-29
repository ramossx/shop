class Itemcomment < ApplicationRecord
	belongs_to :item
	belongs_to :user


	validates :text, presence:true
    validates :text, length: { maximum: 150 }
end
