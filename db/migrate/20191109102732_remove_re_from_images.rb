class RemoveReFromImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :images, :integer, :integer
  end
end
