class DropUserCommentRatings < ActiveRecord::Migration[7.0]
  def change
    drop_table :user_comment_ratings

  end
end
