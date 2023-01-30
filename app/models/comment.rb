class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post,foreign_key:'post_id',optional:true,counter_cache: true
  has_many :usercommentratings
  has_many :users, :through => :usercommentratings

end
