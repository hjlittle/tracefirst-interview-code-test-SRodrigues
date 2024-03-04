class Animal < ApplicationRecord
  # validates the presence of the unique_tag, and make sure its unique
  validates :unique_tag, uniqueness: true
  has_many :tests, dependent: :restrict_with_exception
end
