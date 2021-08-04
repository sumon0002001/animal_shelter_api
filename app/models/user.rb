class User < ApplicationRecord
  has_one :favourite
  validates :username, presence: true, uniqueness: true
  validates :username,  format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
end
