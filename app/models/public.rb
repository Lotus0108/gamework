class Public < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_many :item_comments, dependent: :destroy

  def self.guest
    find_or_create_by!(name: 'guestuser' ,email: 'guest@example.com') do |public|
      public.password = SecureRandom.urlsafe_base64
      public.name = "guestuser"
    end
  end

end
