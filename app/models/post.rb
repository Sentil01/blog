class Post < ApplicationRecord
  belongs_to :topic,optional:true,foreign_key:'topic_id'
end
