class Book < ApplicationRecord
  has_many :writes, dependent: :destroy
  has_many :authors, through: :writes
end
