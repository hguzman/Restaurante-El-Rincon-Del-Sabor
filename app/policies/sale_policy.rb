class SalePolicy
  attr_reader :user, :sale

  def initialize(user, sale)
    @user = user
    @sale = sale
  end

  def index?
    @user.has_role? :admin

  end
  def new?
    @user.has_role? :admin
  end
  def edit?
    @user.has_role? :admin
  end
end
