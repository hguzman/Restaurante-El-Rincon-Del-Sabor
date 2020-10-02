class Sales::SaleDetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sale
  before_action :set_sale_detail, only: [:edit, :update, :destroy]

  def index
    @details = @sale.sale_details.all
  end

  def new
    @sale_detail = @sale.sale_details.new
  end

  def edit
    # code
  end

  def create
    @sale_detail = @sale.sale_details.new(sale_detail_params)
    if @sale_detail.save
      redirect_to sale_sale_details_url(@sale, @sale_detail)
    else
      render :new
    end
  end

  private

    def set_sale_detail
      @sale_detail = @sale.sale_details.find(params[:id])
    end

    def set_sale
      @sale = Sale.find(params[:sale_id])
    end

    def sale_detail_params
      params.require(:sale_detail).permit(:cantidad, :dish_id)
    end
end
