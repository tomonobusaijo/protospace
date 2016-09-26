class AddLikeCountToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :like_count, :integer
  end
end
