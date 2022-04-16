class Public < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image

  has_many :items, dependent: :destroy
  has_many :item_comments, dependent: :destroy

  # フォローをした、されたの関係
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  # 一覧画面で使う
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

    # フォローしたときの処理
  def follow(public_id)
    relationships.create(followed_id: public_id)
  end
  # フォローを外すときの処理
  def unfollow(user_id)
    relationships.find_by(followed_id: public_id).destroy
  end
  # フォローしているか判定
  def following?(public)
    followings.include?(public)
  end

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @public = Public.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @public = Public.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @public = Public.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @public = Public.where("name LIKE?","%#{word}%")
    else
      @public = Public.all
    end
  end

end
