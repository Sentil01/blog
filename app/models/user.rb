class User < ApplicationRecord
  has_many :posts_users_read_statuses
  has_many :posts, :through => :posts_users_read_statuses
  has_many :user_comment_ratings
  has_many :comments, :through => :user_comment_ratings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
