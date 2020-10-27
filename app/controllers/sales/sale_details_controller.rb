class Sales::SaleDetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sale
  before_action :set_sale_detail, only: [:edit, :update, :destroy]

  def index
    authorize Sale
    @details = @sale.sale_details.paginate(page: params[:page], per_page:3)
  end

  def new
    @sale_detail = @sale.sale_details.new
    authorize @sale
  end

  def edit
  end


  def create
    # debugger
    @sale_detail = @sale.sale_details.new(sale_detail_params)
    respond_to do |format|
      if @sale_detail.save
        format.html { redirect_to sale_sale_details_url(@sale, @sale_detail)}
        format.json { head :no_content }
        format.js
      else
        render :new
      end
    end
  end

  def destroy
    @sale_detail.destroy
    respond_to do |format|
      format.json { head :no_content }
      format.js
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
