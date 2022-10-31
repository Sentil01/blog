class CreatePostsUsersReadStatus < ActiveRecord::Migration[7.0]
  def change
    create_table :posts_users_read_statuses do |t|
      t.integer :user_id
      t.integer :post_id
      t.timestamps
    end
  end
end
