class Album
  attr_reader :title, :artist

  def initialize(options = {})
    @title = options[:title]
    @label = options[:label]
    @artist = options[:artist]
  end

  def max_rating
    10
  end

  def min_rating
    1
  end

  def user_rating(rating)
    @rating = '%.1f' % rating
    @rating.to_f
  end
end
