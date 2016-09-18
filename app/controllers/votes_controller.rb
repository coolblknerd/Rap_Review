class VotesController < ApplicationController
  before_action :find_song
  before_action :find_vote

  def upvote
    @vote.increment!(:likes, 1)
  end

  def downvote
    @vote.increment!(:dislikes, 1)
  end

  private

  def find_song
    @song = Song.find(params[:song_id])
  end

  def vote_params
    params.require(:vote).permit(:likes, :dislikes)
  end

  def find_vote
    # .reload forces a database read
    @vote = @song.vote
  end

end
