require "httparty"

##USE rails runner SCRIPTNAME to make sure rails is loaded
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
    subreddit = Subreddit.new(
      subscriber_count: raw_data["data"]["subscribers"], 
      url: raw_data["data"]["url"],
      name: raw_data["data"]["display_name"],
      description: raw_data["data"]["public_description"]
      )
    if Subreddit.where(url: raw_data["data"]["url"]).empty?
      subreddit.save
    end
    
  end

  def get_top_subreddit_data(n)
    #default will only return the existing 49 default subreedits
    total_results = []
    after = ""
    queries = 0
    while total_results.length < n
      limit = n - total_results.length
      sleep(1)
      queries += 1
      headers = { "Authorization" => "bearer #{oath_token}",
                  "user-agent" => agent }
      query = { limit: limit, after: after}
      api_response = client.get("https://oauth.reddit.com/subreddits/popular.json",
                                  headers: headers,
                                  query: query
                                 )
      after = api_response["data"]["after"]
      total_results += api_response["data"]["children"]
    end
    print "ran #{queries} queries"
    return total_results
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


s = SubredditApi.new
s.top_subreddits(199)

# # user connections

#   def run
#     # posts = get_subreddit_posts("hot", "pics")
#     # authors = get_authors(posts)
#     # authors.each do |author|
#       get_subreddits_for_author("spez")
#     # end
#   end

#   def get_subreddit_posts(type, subreddit)
#     #returns an array of posts
#     posts = HTTParty.get("https://oauth.reddit.com/r/#{subreddit.to_s}/#{type.to_s}.json",
#       :headers => {"Authorization" => "bearer #{@token}",
#         'user-agent' => "uniquenameforsupercoolbot191919" },
#       :query => {limit: 1}
#       )
#     return posts
#   end

#   def get_authors(posts)
#     authors = []
#     posts["data"]["children"].each do |post|
#       unless post['data']['stickied']
#         authors.push(post['data']['author'])
#       end
#     end
#     puts authors.count
#     return authors
#   end

#   def get_subreddits_for_author(author)
#     author_subreddits = HTTParty.get("https://oauth.reddit.com/user/#{author}/comments.json",
#       :headers => {"Authorization" => "bearer #{@token}",
#         'user-agent' => "uniquenameforsupercoolbot191919" },
#       :query => {limit: 10}
#       )
#     commented_subreddits = []
#     author_subreddits["data"]["children"].each do |comment|
#       commented_subreddits.push(comment["data"]["subreddit"])
#     end
#     puts commented_subreddits
#   end

# end
