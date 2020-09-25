class Categories::DishesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category
  before_action :set_dish, only: [:edit, :update, :destroy]

  def index
    @dishes = @category.dishes.all
  end

  def new
    @dish = @category.dishes.new
  end


  def edit
  end

  def create
    @dish = @category.dishes.new(dish_params)
    if @dish.save
      redirect_to category_dishes_path(@category, @dish),notice: "creado exitosamente"
    else
      render :new
    end
  end

  def update
    if @dish.update(dish_params)
      redirect_to  category_dish_path(@category, @dish),notice: "actualizado exitosamente"
    else
      render :edit
    end
  end

  def destroy
    @dish.destroy
    redirect_to category_dishes_path(@category),notice: "eliminado exitosamente"
  end

  private

  def set_dish
    @dish = @category.dishes.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def dish_params
    params.require(:dish).permit(:nombre, :existencia, :precio, :descripcion)
  end
end
