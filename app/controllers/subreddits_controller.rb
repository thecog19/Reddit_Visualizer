class SubredditsController < ApplicationController

  def index
    @subreddits = Subreddit.all
    respond_to do |format|
      format.json {render json: @subreddits}
    end
  end

  def show
    if params[:id] == '0'
      @subreddit = Subreddit.find_by(name: params[:name])
    else
      @subreddit = Subreddit.find_by(id: params[:id])
    end
    if @subreddit
      puts "subreddit: #{@subreddit}"
      @children = @subreddit.get_top_connections(5)
      respond_to do |format|
        format.json
      end
    else
      render json: "Subreddit not found.".to_json, status: 404
    end
  end

end
