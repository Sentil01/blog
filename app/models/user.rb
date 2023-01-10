class User < ApplicationRecord
  has_many :posts_users_read_statuses
  has_many :posts, :through => :posts_users_read_statuses
  has_many :usercommentratings
  has_many :comments, :through => :usercommentratings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
