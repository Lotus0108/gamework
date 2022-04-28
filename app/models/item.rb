class Item < ApplicationRecord

has_many :item_comments, dependent: :destroy

belongs_to :public

validates :title, presence: true
validates :body, presence: true, length: { maximum: 200 }

end