class Veterinarian < ApplicationRecord
  has_many :tests, dependent: :restrict_with_exception
  validate :valid_international_phone_number

  def valid_international_phone_number
    return if number.blank?
    # Regex to validate international phone number
    # A plus symbol at the beginning (+), 
    # Followed by 6 to 14 occurrences of digits, where each digit can be optionally followed by a space.
    # Ends with a digit.
    unless number.match(/\A\+(?:[0-9] ?){6,14}[0-9]\z/)
      errors.add(:number, "must be a valid international phone number format")
    end
  end

end
