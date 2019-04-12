class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include CurrentCart

  before_action :set_cart
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_user_location!, if: :storable_location?


    def after_sign_in_path_for(resource_or_scope)
        stored_location_for(resource_or_scope) || super
    end

    def after_sign_out_path_for(resource_or_scope)
        request.referer
    end

  protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password)}
    end

    rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, alert: exception.message
    end

  private
   # Its important that the location is NOT stored if:
   # - The request method is not GET (non idempotent)
   # - The request is handled by a Devise controller such as Devise::SessionsController as that could cause an
   #    infinite redirect loop.
   # - The request is an Ajax request as this can lead to very unexpected behaviour.
   def storable_location?
     request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
   end

   def store_user_location!
     # :user is the scope we are authenticating
     store_location_for(:user, request.fullpath)
   end

end
