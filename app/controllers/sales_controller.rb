class SalesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sale, only: [:edit, :destroy, :show]

  def index
    authorize Sale
    @sales = Sale.paginate(page: params[:page], per_page:4)
  end

  def new
    @sale = Sale.new
    authorize @sale
  end

  def create
    @sale = Sale.new(sale_params)
    respond_to do |format|
      if @sale.save
        format.js {redirect_to sale_sale_details_path(@sale)}
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
      ActiveRecord::Base.transaction do
        @sale.sale_details.map do |detail|
          plato_vendido = Dish.find(detail.dish_id)
          plato_vendido.existencia+=detail.cantidad
          ActiveRecord::Rollback unless plato_vendido.save
        end
        ActiveRecord::Rollback unless @sale.destroy
      end

      respond_to do |format|
        format.html { redirect_to sales_url, notice: 'La venta ha sido cancelada.' }
        format.json { head :no_content }
    end
  end

  private

  def set_sale
    @sale = Sale.find(params[:id])
  end

  def sale_params
    params.require(:sale).permit(:total, :client_id, :user_id, :dish_id)
  end
end
