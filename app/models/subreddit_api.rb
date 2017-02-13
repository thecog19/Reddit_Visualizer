require "httparty"

class SubredditApi

  def initialize(args = {})
    @agent = ENV["REDDIT_AGENT"]
    @username =  ENV["REDDIT_USERNAME"]
    @password = ENV["REDDIT_PASSWORD"]
    @id = ENV["REDDIT_ID"]
    @secret = ENV["REDDIT_SECRET"]
    @client = args.fetch(:client, HTTParty)
  end

  def top_subreddits(n)
    raw_subreddit_data = get_top_subreddit_data(n)
    cleanse_all_subreddit_data(raw_subreddit_data)
  end

  def get_subreddit_authors(subreddit, count)
    authors = {}
    while authors.length < count
      posts = get_subreddit_posts(subreddit, count)
      get_authors_of(authors, posts, count)
    end
    authors.keys
  end

  def get_commented_subreddits_for(author)
    sleep(1)
    get_comments_for(author).map do |comment|
      comment["data"]["subreddit"]
    end
  end

  private
  attr_reader :agent, :username, :password, :id, :secret, :client

  def get_comments_for(author)
    headers = {"Authorization" => "bearer #{oath_token}",
               'user-agent' => agent }
    query = {limit: 100}
    response = client.get("https://oauth.reddit.com/user/#{author}/comments.json",
                          headers: headers,
                          query: query
                         )
    response["data"]["children"]
  end


  def cleanse_all_subreddit_data(all_subreddit_data)
    all_subreddit_data.map! do |subreddit_data|
      cleanse_subreddit_data(subreddit_data)
    end
  end

  def cleanse_subreddit_data(subreddit_data)
    {
      subscriber_count: subreddit_data["data"]["subscribers"],
      url: subreddit_data["data"]["url"],
      name: subreddit_data["data"]["display_name"],
      description: subreddit_data["data"]["public_description"]
    }
  end

  def get_top_subreddit_data(n)
    headers = { "Authorization" => "bearer #{oath_token}",
                "user-agent" => agent }
    query = { limit: n }
    api_response = client.get("https://oauth.reddit.com/subreddits/default.json",
                              headers: headers,
                              query: query
                             )
    api_response["data"]["children"]
  end

  def get_subreddit_posts(subreddit, limit, type = "hot")
    sleep(1)
    headers = {"Authorization" => "bearer #{oath_token}",
               "user-agent" => agent }
    query = {limit: limit}
    response = client.get("https://oauth.reddit.com/r/#{subreddit.to_s}/#{type.to_s}.json",
                          headers: headers,
                          query: query
                         )
    response["data"]["children"]
  end

  def get_authors_of(authors, posts, count)
    posts.each do |post|
      author = post["data"]["author"]
      authors[author] = true
      break if authors.length == count
    end
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
