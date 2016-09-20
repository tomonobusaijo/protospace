class AddIndexToCapturedimage < ActiveRecord::Migration
  def change
  end
  add_index :capturedimages, :role
end
