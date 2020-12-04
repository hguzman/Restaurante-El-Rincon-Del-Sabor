class Settings::AccountController < ApplicationController
  respond_to :html
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :update, :destroy]

  def show
  end

  def update
    if @user.update_with_password(user_params)
      sign_in @user, :bypass => true
      redirect_to settings_accaunt_path, flash: { notice: "se ha actualizado" }
    else
      flash[:alert]=t('.alert');
      render :settings_accaunt_path
    end
  end
  
  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit( :password, :password_confirmation)
  end
end
