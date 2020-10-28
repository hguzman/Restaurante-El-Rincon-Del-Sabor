class DishPolicy
  attr_reader :user, :dish

  def initialize(user, dish)
    @user = user
    @dish = dish

  end

  def index?
    @user.has_role? :admin

  end

  def new?
    @user.has_role? :admin

  end

  def update
    @user.has_role? :admin
  end

  def destroy?
    @user.has_role? :admin
  end
end
