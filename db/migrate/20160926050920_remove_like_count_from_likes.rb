class RemoveLikeCountFromLikes < ActiveRecord::Migration
  def change
    remove_column :likes, :like_count, :integer
  end
end
