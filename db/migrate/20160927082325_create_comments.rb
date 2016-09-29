class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true, foreign_key: "user_id"
      t.references :prototype, index: true, foreign_key: "prototype_id"
      t.text :content
      t.timestamps
    end
  end
end
