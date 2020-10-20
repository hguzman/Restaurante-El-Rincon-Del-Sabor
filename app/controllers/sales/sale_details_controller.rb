class Sales::SaleDetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sale
  before_action :set_sale_detail, only: [:edit, :update, :destroy]

  def index
    @details = @sale.sale_details.paginate(page: params[:page], per_page:3)
  end

  def new
    @sale_detail = @sale.sale_details.new
  end

  def edit
  end


  def create
    # debugger
    @sale_detail = @sale.sale_details.new(sale_detail_params)
    respond_to do |format|
      if @sale_detail.save
        format.html { redirect_to sale_sale_details_path(@sale, @sale_detail)}
        format.json { head :no_content }
        format.js
      else
        render :new
      end
    end
  end

  def update
    if @sale_detail.update(sale_detail_params)
      redirect_to  sale_sale_details_path(@sale, @sale_detail)
    else
      render :index
    end
  end

  def destroy
    @sale_detail.destroy
      redirect_to sale_sale_details_path
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
