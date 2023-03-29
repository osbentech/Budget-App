# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # make a current_user method available to all controllers
  before_action :update_allowed_parameters, if: :devise_controller? # allow name in params
  before_action :set_user

  protected

  def set_user
    ## to get the current user via session_id
    @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
    ## to authenticate user via devise unless the current user have a session
    @current_user
    authenticate_user! unless @current_user
  end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :password_confirmation)
    end
  end
end
