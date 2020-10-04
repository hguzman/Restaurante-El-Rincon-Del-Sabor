class DishesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_dish, only: [:edit, :update, :destroy]

  def index
    @dishes = Dish.paginate(page: params[:page], per_page:4)
  end

  def new
    @dish = Dish.new
  end

  def edit
    # code
  end

  def show
    # code
  end

  def create
    @dish = Dish.new(dish_params)

    respond_to do |format|
      if @dish.save
        format.html { redirect_to dishes_path, notice: 'plato creado'}
        format.json { render :show, status: :created, location: @dish }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @dish
        format.html { redirect_to dishes_path, notice: 'se ha actualizado'}
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @dish.destroy
    respond_to do |format|
      format.html {redirect_to dishes_path, notice: 'se ha eliminado'}
      format.json { render json: @resource }
    end
  end

  private

     def set_dish
       @dish = Dish.find(params[:id])
     end

     def dish_params
      params.require(:dish).permit(:nombre, :existencia, :precio, :descripcion, :category_id)
     end
end
