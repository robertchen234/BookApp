class Author < ApplicationRecord
  has_many :writes, dependent: :destroy
  has_many :books, through: :writes
end
