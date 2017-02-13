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
    # posts = get_subreddit_posts("hot", "pics")
    # authors = get_authors(posts)
    # authors.each do |author|
      get_subreddits_for_author("spez")
    # end
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
    posts = HTTParty.get("https://oauth.reddit.com/r/#{subreddit.to_s}/#{type.to_s}.json",
      :headers => {"Authorization" => "bearer #{@token}",
        'user-agent' => "uniquenameforsupercoolbot191919" },
      :query => {limit: 1}
      )
    return posts
  end

  def get_authors(posts)
    authors = []
    posts["data"]["children"].each do |post|
      unless post['data']['stickied']
        authors.push(post['data']['author'])
      end
    end
    puts authors.count
    return authors
  end

  def get_subreddits_for_author(author)
    author_subreddits = HTTParty.get("https://oauth.reddit.com/user/#{author}/comments.json",
      :headers => {"Authorization" => "bearer #{@token}",
        'user-agent' => "uniquenameforsupercoolbot191919" },
      :query => {limit: 10}
      )
    commented_subreddits = []
    author_subreddits["data"]["children"].each do |comment|
      commented_subreddits.push(comment["data"]["subreddit"])
    end
    puts commented_subreddits
  end

end
RedditBot.new.run
