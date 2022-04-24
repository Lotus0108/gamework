class Tag < ApplicationRecord
  has_many :post_tags,dependent: :destroy, foreign_key: 'tag_id'
  has_many :items,through: :item_tags

  validates :name, uniqueness: true, presence: true
end
