class SubredditsController < ApplicationController

  def show
    if params[:id] == '0'
      @subreddit = Subreddit.find_by(name: params[:name])
    else
      @subreddit = Subreddit.find_by(id: params[:id])
    end
    if @subreddit
      puts "subreddit: #{@subreddit}"
      @children = @subreddit.destination_subreddits
      respond_to do |format|
        format.json
      end
    end
  end

end
