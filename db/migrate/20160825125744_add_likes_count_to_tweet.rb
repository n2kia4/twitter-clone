class AddLikesCountToTweet < ActiveRecord::Migration[5.0]
  def change
    add_column :tweets, :likes_count, :integer, null: false, default: 0
  end
end
