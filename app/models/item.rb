class Item < ApplicationRecord

has_many :item_comments, dependent: :destroy

belongs_to :public

# 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @item = Item.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @item = Item.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @item = Item.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @item = Item.where("title LIKE?","%#{word}%")
    else
      @item = Item.all
    end
  end

end
