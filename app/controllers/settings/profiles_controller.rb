class Settings::ProfilesController < ApplicationController
  respond_to :html
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :update, :destroy]

  def show
    @profile = current_user.profile
  end

  def update
    if @profile.update(profile_params)
      flash[:success] = t(".success")
      redirect_to settings_profile_path
    else
      flash[:alert] = t(".alert")
      render :show
    end
  end

  # def destroy
  #   @profile.destroy
  #   redirect_to unauthenticated_root_path
  # end

  private

  def profile_params
    params.require(:profile).permit(:name, :fullname)
  end

  def set_profile
    @profile = current_user.profile
  end
end
