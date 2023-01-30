class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  def after_sign_in_path_for(resource)
    UserMailer.send_mail(current_user).deliver_later
    root_path
  end

  rescue_from CanCan::AccessDenied do | exception |
    redirect_to root_url, alert: exception.message
  end
end
