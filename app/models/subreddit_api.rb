require "httparty"

class SubredditApi

  def initialize
    @agent = ENV["REDDIT_AGENT"]
    @username =  ENV["REDDIT_USERNAME"]
    @password = ENV["REDDIT_PASSWORD"]
    @id = ENV["REDDIT_ID"]
    @secret = ENV["REDDIT_SECRET"]
    @client = HTTParty
  end

  def top_subreddits(n)
    raw_subreddit_data = get_top_subreddit_data(n)
    cleanse_all_data(raw_subreddit_data)
  end

  private
  attr_reader :agent, :username, :password, :id, :secret, :client

  def cleanse_all_data(raw_subreddit_data)
    raw_subreddit_data.map! do |subreddit_data|
      cleanse_subreddit_data(subreddit_data)
    end
  end

  def cleanse_subreddit_data(raw_data)
    #cleansed_data = {}
    #cleansed_data["name"] = raw_data["data"]["display_name"]
  end

  def get_top_subreddit_data(n)
    headers = { "Authorization" => "bearer #{oath_token}",
                "user-agent" => agent }
    query = { limit: n }
    api_response = client.get("https://oauth.reddit.com/subreddits/popular.json",
                                headers: headers,
                                query: query
                               )
    api_response["data"]["children"]
  end

  def oath_token
    basic_auth = { username: id,
                   password: secret }
    headers = { "user-agent" => agent }
    body = { grant_type:  "password",
             username:  username,
             password: password }
    token_info = client.post("https://www.reddit.com/api/v1/access_token",
                               basic_auth: basic_auth,
                               headers: headers,
                               body: body
                              )
    token_info["access_token"]
  end

end

