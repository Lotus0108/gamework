class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "Public"
  belongs_to :followed, class_name: "Public"
end
