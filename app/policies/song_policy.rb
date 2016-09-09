class SongPolicy
  attr_reader :current_user, :song

  def initialize(current_user, song)
    @user = current_user
    @song = song
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
