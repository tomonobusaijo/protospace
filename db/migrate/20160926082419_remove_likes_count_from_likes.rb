class RemoveLikesCountFromLikes < ActiveRecord::Migration
  def change
    remove_column :likes, :likes_count, :integer
  end
end
