class ClientPolicy
  attr_reader :user, :client

  def initialize(user, client)
    @user = user
    @client = client
  end

  def index?
    @user.has_role? :admin

  end
  def new?
    @user.has_role? :admin
  end
  def show?

  end
end
