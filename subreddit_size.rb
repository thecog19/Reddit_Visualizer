require "httparty"
require "pp"

class RedditBot

  def init
    @token
    @agent = ENV["user_agent"]
    @username =  ENV["username"]
    @password = ENV["password"]
    @id = ENV["reddit_id"]
    @secret = ENV["reddit_secret"]
    get_oath_token
  end

  def run
    get_subreddits
  end

  def get_oath_token
    auth = {:username => @id,
           :password => @secret}
    token_info = HTTParty.post("https://www.reddit.com/api/v1/access_token",
      :basic_auth  => auth,
      :headers => {'user-agent' => @agent },
      :body => { :grant_type => 'password',
                :username =>  @username,
                :password => @password,
                }
                   )
    @token = token_info["access_token"]
  end

  def get_subreddits
    #returns an array of subreddits
    subreddits = HTTParty.get("https://oauth.reddit.com/subreddits/popular.json",
      :headers => {"Authorization" => "bearer #{@token}",
        'user-agent' => "uniquenameforsupercoolbot191919" },
      :query => {limit: 100}
      )
    generate_subreddit_hash(subreddits)
  end

  def generate_subreddit_hash(subreddits)
    subreddit_data = {}
    subreddits["data"]["children"].each do |subreddit|
      subreddit_data[subreddit["data"]["display_name"]] = subreddit["data"]["subscribers"]
    end
    puts subreddit_data
  end

end
RedditBot.new.run
