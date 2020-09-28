class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private
  def user_not_authorized
    flash[:alert] = 'Usted no cuenta con permisos para acceder a este recurso'
    redirect_to(request.referrer || root_path)

  end

end
