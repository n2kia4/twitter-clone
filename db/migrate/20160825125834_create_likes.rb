class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.references :user, index: true
      t.references :tweet, index: true

      t.timestamps
    end
    add_index :likes, [:user_id, :tweet_id], unique: true
  end
end
