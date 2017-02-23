class PathsController < ApplicationController

  def show
    start_subreddit = Subreddit.find_by(name: params[:beginning])
    end_subreddit = Subreddit.find_by(name: params[:destination])

    path = Pathfinder.new
    @path = path.find_path(start_subreddit, end_subreddit)
    respond_to do |format|
      format.json 
    end
  end

end
