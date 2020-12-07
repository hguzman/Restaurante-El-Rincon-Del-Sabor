class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:cambiar_password, :update_password, :destroy]
  before_action :set_user, only: [:update, :cambiar_password, :update_password]
  respond_to :html

  def cambiar_password
  end

  def update_password
    if @user.update_with_password(user_params)
      bypass_sign_in(@user)
      redirect_to settings_change_password_path, notice: "contaseña actualizada"
    else
      render "settings/change_password"
    end
  end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: "Perfil actualizado"
    else
      render "settings/profile"
    end
  end

  def destroy
    @user.destroy
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
      params.require(:user).permit(:current_password,:nombres,:email,:password,:password_confirmation,:apellidos,:direccion,:telefono,:sexo, :cedula, :avatar)
  end
end
