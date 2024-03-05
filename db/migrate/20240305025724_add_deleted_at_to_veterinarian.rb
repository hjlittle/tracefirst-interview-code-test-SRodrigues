class AddDeletedAtToVeterinarian < ActiveRecord::Migration[6.1]
  def change
    add_column :veterinarians, :deleted_at, :datetime
    add_index :veterinarians, :deleted_at
  end
end
