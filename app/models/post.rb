class Post < ApplicationRecord
  validates :title, length: { maximum: 20,too_long: "%{count} characters is the maximum allowed"  }
  belongs_to :user
  belongs_to :topic,optional:true,foreign_key:'topic_id'
  has_many :comments,dependent: :destroy
  has_many :taggables,dependent: :destroy
  has_many :tags,through: :taggables
  has_many :ratings
  has_one_attached :cover_picture
  has_many :posts_users_read_statuses
  has_many :users, :through => :posts_users_read_statuses
end