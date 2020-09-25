class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:show, :edit, :update, :destroy]


  def index
    authorize Category
    @categories = Category.paginate(page: params[:page], per_page:4)
  end


  def show
    # authorize @category
  end


  def new
    @category = Category.new
    authorize @category
  end


  def edit
    authorize @category
  end


  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_url, notice: '  se ha actualizado'}

        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
     respond_to do |format|
       if @category.update(category_params)
         format.html { redirect_to categories_url, notice: 'se ha actualizado' }
         format.json { render :show, status: :ok, location: @category }
       else
         format.html { render :edit }
         format.json { render json: @category.errors, status: :unprocessable_entity }
       end
     end
   end

   def destroy
     @category.destroy
     respond_to do |format|
       format.html { redirect_to categories_url, notice: 'se ha eliminado.' }
       format.json { head :no_content }
     end
   end
   private

     def set_category
       @category = Category.find(params[:id])
     end


     def category_params
       params.require(:category).permit(:nombre, :descripcion)
     end
 end
