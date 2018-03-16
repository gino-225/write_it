class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #this is for aloowing a user_name field to be created
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
  end
  #user_name end see#https://stackoverflow.com/questions/46092754/rails-when-adding-column-username-to-devise-username-value-still-shows-as-nil

end
