class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :destroy, :update, :show]

    def index
      # authorize User
      @users = User.all
    end

    def show
    end

    def new
      @user= User.new
       # authorize @user
    end

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to users_path
        flash.notice= "User creado"

      else
        render :new
      end

    end

    def update
      if @user.update(user_params)
        redirect_to users_path
        flash.notice="User editado"
      else
        render :edit
      end
    end

    def destroy
      @user.destroy
      redirect_to users_path
      flash.alert="User eliminado"
    end

    def edit
    end

    def set_user
      @user = User.find(params[:id])
    end

  def user_params
      params.require(:user).permit(:nombres,:email,:password,:password_confirmation,:apellidos,:direccion,:telefono,:sexo, :cedula, :avatar)
  end
end
