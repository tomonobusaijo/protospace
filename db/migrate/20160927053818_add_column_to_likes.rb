class AddColumnToLikes < ActiveRecord::Migration
  def change
    add_reference :likes, :user, index: true, foreign_key: "user_id"
    add_reference :likes, :prototype, index: true, foreign_key: "prototype_id"
  end
end
