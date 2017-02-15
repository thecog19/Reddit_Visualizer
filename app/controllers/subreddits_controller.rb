class SubredditsController < ApplicationController

  def show
    @subreddit = Subreddit.find_by(id: params[:id])
    if @subreddit
      p "--------------------------------------------------------"
      @children = @subreddit.destination_subreddits
      p @subreddit
      p @children
      respond_to do |format|
        format.json
        # { render json: @subreddit.to_json(include: :destination_subreddits) }
          # { subreddits: @subreddit, children: @children } }
      end
    end
  end

end
