class SalesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sale, only: [:edit, :destroy]

  def index
    @sales = Sale.paginate(page: params[:page], per_page:4)
    respond_to do |format|
      format.html
      format.pdf {render template: 'sales/reporte', pdf: 'reporte'}
    end
  end

  def new
    @sale = Sale.new
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
    @sale.destroy
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
