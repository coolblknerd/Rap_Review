class AlbumPolicy
  attr_reader :current_user, :album

  def initialize(current_user, album)
    @user = current_user
    @album = album
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    @user.admin?
  end

  def edit?
    create?
  end

  def update?
    @user.admin?
  end

  def destroy?
    @user.admin?
  end

end
