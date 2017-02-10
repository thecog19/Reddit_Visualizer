require "httparty"
require "pp"

class SubredditApi

  attr_reader :agent, :username, :password, :id, :secret, :token

  def init
    @agent = ENV["user_agent"]
    @username =  ENV["username"]
    @password = ENV["password"]
    @id = ENV["reddit_id"]
    @secret = ENV["reddit_secret"]
    @token = get_oath_token
  end

  def top_subreddits(n)
    raw_subreddit_data = get_top_subreddit_data(n)
    cleanse_all_data(raw_subreddit_data)
  end

  private

  def cleanse_all_data(raw_subreddit_data)
    raw_subreddit_data.each do |subreddit_data|
      cleanse_subreddit_data(subreddit_data)
    end
  end

  def cleanse_subreddit_data(subreddit_data)
    # TODO
  end

  def get_top_subreddit_data(n)
    headers = { "Authorization" => "bearer #{token}",
                "user-agent" => "uniquenameforsupercoolbot191919" }
    query = { limit: n }
    api_response = HTTParty.get("https://oauth.reddit.com/subreddits/popular.json",
                                headers: headers,
                                query: query
                               )
    api_response["data"]["children"]
  end

  def get_oath_token
    basic_auth = { username: id,
                   password: secret }
    headers = { "user-agent" => agent }
    body = { grant_type:  "password",
             username:  username,
             password: password }
    token_info = HTTParty.post("https://www.reddit.com/api/v1/access_token",
                               basic_auth: basic_auth,
                               headers: headers,
                               body: body
                              )
    token_info["access_token"]
  end

end

