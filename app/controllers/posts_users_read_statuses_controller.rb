class PostsUsersReadStatuses < ApplicationController
  # before_action :posts_users_read_status_params
  # before_action :get_PostsUsersReadStatus
  # def new
  #   @posts_users_read_status=PostsUsersReadStatus.new
  # end
  #   def create
  #       @posts_users_read_status=PostsUsersReadStatus.build(posts_users_read_status_params)
  #       respond_to do |format|
  #         if @posts_users_read_status.save
  #           @post = Post.find(@posts_users_read_status.post_id)
  #           format.html { redirect_to posts_path(@post), notice: 'Successfully marked as read.' }
  #         end
  #       end
  #   end
  #
  #
  # private
  #
  # def get_PostsUsersReadStatus
  #   @posts_users_read_status=PostsUsersReadStatus.find(params[:id])
  # end
  # def posts_users_read_status_params
  #   params.require(:posts_users_read_status).permit(:user_id,:post_id)
  # end
end