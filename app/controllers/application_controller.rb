class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include CurrentCart
  before_action :set_cart
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password)}
    end

    rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, alert: exception.message
    end

    def after_sign_in_path_for(resource)
    users_path #your path
    end

end
