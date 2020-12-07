class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  #get
  def index
    # authorize Category
    @categories = Category.paginate(page: params[:page], per_page:4)
  end
  #get
  def show
    authorize @category
  end
  #get
  def new
    @category = Category.new
     authorize @category
  end
  #get
  def edit
    authorize @category
  end
  #post
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_url, notice: 'Creada exitosamente'}
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end
  #patch
  def update
     respond_to do |format|
       if @category.update(category_params)
         format.html { redirect_to categories_url, notice: 'actualizada exitosamente' }
         format.json { render :show, status: :ok, location: @category }
       else
         format.html { render :edit }
         format.json { render json: @category.errors, status: :unprocessable_entity }
       end
     end
  end
  #delete
   def destroy
     @category.destroy

     respond_to do |format|
       format.html { redirect_to categories_url, notice: 'eliminado exitosamente' }
       format.json { head :no_content }
     end
   end
  private

  def set_category
   # @category = Category.find(params[:id])
   @category = Category.friendly.find(params[:category_id])
  end

  def category_params
   params.require(:category).permit(:nombre, :descripcion, :slug)
  end
end
