class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user only:[:update]

  def update
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
