class CreateFeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :feeds do |t|
      t.string :title
      t.string :content
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
