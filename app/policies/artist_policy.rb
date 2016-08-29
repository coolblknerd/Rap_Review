class ArtistPolicy
  attr_reader :current_user, :artist

  def initialize(current_user, artist)
    @user = current_user
    @artist = artist
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
    update?
  end

  def update?
    @user.admin?
  end

  def destroy?
    @user.admin?
  end
  
end
