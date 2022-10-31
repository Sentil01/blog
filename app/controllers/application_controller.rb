class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  def after_sign_in_path_for(resource)
    root_path
  end

  rescue_from CanCan::AccessDenied do | exception |
    redirect_to root_url, alert: exception.message
  end
end
