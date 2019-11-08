class ApplicationController < ActionController::Base

    helper_method :resource, :resource_name, :devise_mapping

    before_action :configure_permitted_parameters, if: :devise_controller?

    protect_from_forgery with: :exception    
    protected

    def configure_permitted_parameters
         devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :username)}

         devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :username, :email, :password, :current_password, :bio, :pic)}
    end

    def resource_name
        :user
    end
    def resource
      @resource ||= User.new
    end
    def devise_mapping
      @devise_mapping ||= Devise.mappings[:user]
    end

end
