class Author < ApplicationRecord
  has_many :writes, dependent: :destroy
  has_many :books, through: :writes

  validates :name, presence: true
  validates :birth_year, presence: true, numericality: true
end
