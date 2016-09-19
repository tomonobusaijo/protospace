class AddPictureToCapturedimages < ActiveRecord::Migration
  def change
    add_column :capturedimages, :picture, :string
  end
end
