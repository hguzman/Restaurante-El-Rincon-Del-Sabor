class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

 private

 def user_not_authorized
   flash[:alert] = "Usted NO tiene permiso para esta acción."
   redirect_to(request.referrer || root_path)
 end
end
