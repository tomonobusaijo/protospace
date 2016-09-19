class CreateCapturedimages < ActiveRecord::Migration
  def change
    create_table :capturedimages do |t|
      t.integer :prototype_id
      t.integer :role, main: 0, null: false, sub: 1
      t.timestamps null: false
    end
  end
end
