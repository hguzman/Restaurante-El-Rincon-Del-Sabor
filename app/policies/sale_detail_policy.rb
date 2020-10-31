class Sale_detailPolicy
  attr_reader :user, :sale_detail

  def initialize
    @user = user
    @sale_detail = sale_detail
  end

  def index?
    @user.has_role? :admin

  end

  def new?
    @user.has_role? :admin

  end
end
