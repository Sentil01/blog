class UserCommentRatingController < ApplicationController

    before_action :get_comment
    before_action :set_user
    before_action :set_user_comment_rating, only: %i[ show edit update destroy ]
    before_action :set_params,only: %i[ show edit update destroy ]
      def index
      @user_comment_ratings=UserCommentRating.all

    end
    def new
      @user_comment_rating = UserCommentRating.new

    end
    def create
      @user_comment_rating=UserCommentRating.build(set_params);
      respond_to do|format|
        if @user_comment_rating.save
          redirect_to comment_user_comment_ratings_path(@comment)
        else
          redirect_to new_comment_user_comment_rating_path(@comment)
        end
      end

    end
    private
    # def get_post
    #   if params[:topic_id].present?
    #     @post = @topic.posts.find(params[:post_id])
    #
    #   else
    #     @post=Post.find(params[:post_id])
    #
    #   end
    # end
    def get_comment
      @comment=Comment.find(params[:comment_id])
    end
    def set_user
      @user=current_user;
    end
    def set_user_comment_rating
      @user_comment_rating=UserCommentRating.find(params[:comment_id]);
    end
    def set_params
      params.require(:user_comment_rating).permit(:star, :user_id, :comment_id);
    end
end

