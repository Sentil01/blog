class CreateUserCommentRating < ActiveRecord::Migration[7.0]
  def change
    create_table :user_comment_ratings do |t|
      t.integer :user_id
      t.integer :comment_id


      t.timestamps
    end
  end
end
