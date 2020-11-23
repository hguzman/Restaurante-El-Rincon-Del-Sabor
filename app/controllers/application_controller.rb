class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nombres, :apellidos])
  end

  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

 private

 def user_not_authorized
   flash[:alert] = "Usted NO tiene permiso para esta acción."
   redirect_to(request.referrer || root_path)
 end
end
