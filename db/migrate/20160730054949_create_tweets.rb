class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.references :user, foreign_key: true
      t.text :content
      t.string :photo

      t.timestamps
    end
    add_index :tweets, [:user_id, :created_at]
  end
end
