class SubredditsController < ApplicationController

  def show
    @subreddit = Subreddit.find_by(id: params[:id])
    @children = @subreddit.destination_subreddits
  end

end
