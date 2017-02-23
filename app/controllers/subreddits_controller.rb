
class SubredditsController < ApplicationController

  def index
    @subreddits = Subreddit.all
    respond_to do |format|
      format.json {render json: @subreddits}
    end
  end

  def show
    if @subreddit = Subreddit.find_by_id_or_name(params)
      Subreddit.where('lower(name) = ?', params[:name])
      successful_show
    else
      failed_show
    end
  end

  private

  def successful_show
    @children = @subreddit.related_subreddits(5)
    respond_to do |format|
      format.json
    end
  end

  def failed_show
    render json: "Subreddit not found.".to_json, status: 404
  end

end
