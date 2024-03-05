class Animal < ApplicationRecord
  has_many :tests, dependent: :restrict_with_exception

  def soft_delete
    update(deleted_at: Time.now)
  end
end
