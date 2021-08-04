class Cat < ApplicationRecord
  validates :pet_name, presence: true
  validates :pet_color, presence: true
  validates :age, presence: true
end
