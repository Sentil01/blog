class Post < ApplicationRecord
  belongs_to :topic,optional:true,foreign_key:'topic_id'
  has_many :comments,dependent: :destroy
  has_many :taggables,dependent: :destroy
  has_many :tags,through: :taggables
end