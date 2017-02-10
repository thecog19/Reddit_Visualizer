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

  def get_subreddit_posts(type, subreddit)
    #returns an array of posts
    reddit_info = HTTParty.get("https://oauth.reddit.com/r/#{subreddit.to_s}/#{type.to_s}.json",
      :headers => {"Authorization" => "bearer #{@token}",
        'user-agent' => "uniquenameforsupercoolbot191919" },
      :query => {limit: 25}
      )
    reddit_info["data"]["children"][3]["data"]
  end

end
File.open("save.txt", 'w') { |file| file.write(RedditBot.new.get_subreddit_posts("hot", "pics")) }