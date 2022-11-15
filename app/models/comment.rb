class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post,foreign_key:'post_id',optional:true
  has_many :user_comment_ratings
  has_many :users, :through => :user_comment_ratings

end
