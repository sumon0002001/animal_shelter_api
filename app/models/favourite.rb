class Favourite < ApplicationRecord
  belongs_to :user
  validates :cat_id, presence: true
  validates :user_id, presence: true, uniqueness: { scope: :cat_id }
end
