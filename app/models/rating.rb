class Rating < ApplicationRecord
  belongs_to :post
  after_save :create_avg

  private
  def create_avg
    average = post.ratings.average(:star)
    post.rating_avg = average
    post.save!
  end

end
