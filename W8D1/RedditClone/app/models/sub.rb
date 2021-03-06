class Sub < ApplicationRecord
  validates :title, :description, :creator_id, presence: true

  belongs_to :moderator,
    class_name: "User",
    foreign_key: :creator_id

  has_many(
    :posts,
    class_name: :Post,
    foreign_key: :sub_id
  )
end
