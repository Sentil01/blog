class PostsUsersReadStatusesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index

  end
  def create
    if PostsUsersReadStatus.find_by(user_id: current_user.id,post_id: params[:post_id])
      @msg="Seen"
    else
      PostsUsersReadStatus.create(user_id: current_user.id,post_id: params[:post_id])
      @msg="Unseen"
    end
    respond_to do |format|
      format.js{render json: @msg.to_json}
      format.html
    end
  end

end