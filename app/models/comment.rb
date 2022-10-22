class Comment < ApplicationRecord
  belongs_to :post,foreign_key:'post_id',optional:true
end
