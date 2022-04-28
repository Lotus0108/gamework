class Item < ApplicationRecord

has_many :item_comments, dependent: :destroy

belongs_to :public

end
