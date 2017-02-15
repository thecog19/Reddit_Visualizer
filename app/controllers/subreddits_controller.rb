class SubredditsController < ApplicationController

  def show
    @subreddit = Subreddit.find_by(id: params[:id])
    if @subreddit 
      @children = @subreddit.destination_subreddits
      respond_to do |format|
        format.json
      end
    end
  end

end
