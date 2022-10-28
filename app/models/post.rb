class Post < ApplicationRecord
  belongs_to :user
  belongs_to :topic,optional:true,foreign_key:'topic_id'
  has_many :comments,dependent: :destroy
  has_many :taggables,dependent: :destroy
  has_many :tags,through: :taggables
  has_many :ratings
  has_one_attached :cover_picture

end