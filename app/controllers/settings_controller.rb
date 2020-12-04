class SettingsController < ApplicationController
  respond_to :html
  before_action :authenticate_user!
  before_action :set_user, only: [:profile, :change_password]

  def profile
  end

  def change_password
  end


  def set_user
    @user = current_user
  end


end
