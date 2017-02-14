require "httparty"
require "figaro"
##bundle exec figaro install
##USE rails runner SCRIPTNAME to make sure rails is loaded
class SubredditApi

  def initialize(args = {})
    @agent = ENV["REDDIT_AGENT"]
    @username =  ENV["REDDIT_USERNAME"]
    @password = ENV["REDDIT_PASSWORD"]
    @id = ENV["REDDIT_ID"]
    @secret = ENV["REDDIT_SECRET"]
    @client = args.fetch(:client, HTTParty)
    @reddits = 0
  end

  def top_subreddits(n)
    raw_subreddit_data = get_top_subreddit_data(n)
    cleanse_all_subreddit_data(raw_subreddit_data)
  end

  def get_subreddit_authors(subreddit, count)
    authors = {}
    while authors.length < count
      posts = get_subreddit_posts(subreddit, count)
      get_authors_of(posts, count, authors)
    end
    authors.keys
  end

  def get_subreddits_commented_on(author)
    sleep(1)
    get_comments_for(author).map do |comment|
      comment["data"]["subreddit"]
    end
  end

  def sub_connectivity(subreddit, num_users = 25, type="hot")
    puts "generating connections for #{subreddit}, number: #{@reddits}"
    posts = get_subreddit_posts(type, subreddit, num_users)
    scores_hash = {}
    authors = get_authors(posts)
    authors.each do |author|
      puts "generating for #{author}"
      subreddits = get_subreddits_for_author(author)
      scores = generate_score(subreddits)
      scores.each do |subreddit, score|
        if scores_hash[subreddit]
          scores_hash[subreddit] += score
        else
           scores_hash[subreddit] = score
        end
      end
    end
    @reddits += 1
    populate_connectivity(subreddit, scores_hash)
  end

  def populate_database(num_sr = 200, num_users = 25)
    top_subreddits(num_sr)
    subreddits = Subreddit.all
    #this is updating dynamically. which is a problem.
    subreddits.each do |subreddit|
      sub_connectivity(subreddit.name, num_users)
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
    uri = URI.encode("https://oauth.reddit.com/r/#{subreddit.name}/#{type}.json")
    response = client.get(uri,
                          headers: headers,
                          query: query
                         )
    response["data"]["children"]
  end

  def get_authors_of(posts, count, authors)
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

  def get_subreddit_posts(type, subreddit, limit)
    sleep(1)
    #returns an array of posts
    #we need to avoid repeat users
    #TO DO avoid repeat users
    posts = HTTParty.get("https://oauth.reddit.com/r/#{subreddit.to_s}/#{type.to_s}.json",
      :headers => {"Authorization" => "bearer #{oath_token}",
        'user-agent' => agent },
      :query => {limit: limit}
      )
    return posts
  end

  def get_sub_count(name)
    data = HTTParty.get("https://oauth.reddit.com/r/#{name.to_s}",
      :headers => {"Authorization" => "bearer #{oath_token}",
        'user-agent' => agent },
      )
    data["data"]["subscribers"]
  end

  def get_authors(posts)
    authors = []
    posts["data"]["children"].each do |post|
      unless post['data']['stickied']
        authors.push(post['data']['author'])
      end
    end
    return authors
  end

  def get_subreddits_for_author(author)
    sleep(1)
    if author == "[deleted]"
      return []
    end
    author_subreddits = HTTParty.get("https://oauth.reddit.com/user/#{author}/comments.json",
      :headers => {"Authorization" => "bearer #{oath_token}",
        'user-agent' => agent },
      :query => {limit: 100}
      )
    commented_subreddits = []
    author_subreddits["data"]["children"].each do |comment|
      commented_subreddits.push(comment["data"]["subreddit"])
    end
    commented_subreddits
  end

  def generate_score(array)
    #this needs to be refactored to reflect actual values, right now, each time a user has posted in a different subreddit, its worth a flat one point.
    scores_hash = {}
    array.each do |sub|
      if !scores_hash[sub]
        scores_hash[sub] = 1
      end
    end
    return scores_hash
  end

  def gen_subreddit(subreddit_name)
    if Subreddit.where(name: subreddit_name).empty?
      subreddit = Subreddit.new(name: subreddit_name,
                                url: "/r/#{subreddit_name}",
                                subscriber_count: get_sub_count(subreddit_name))
      subreddit.save
    else
      subreddit = Subreddit.where(name: subreddit_name).last
    end

    subreddit
  end

  def populate_connectivity(subreddit_name, scores_hash)
    subreddit = gen_subreddit(subreddit_name)
    scores_hash.each do |adj_sub, score|
      adj_sub_record = gen_subreddit(adj_sub)
      if SubredditConnection.where({
                                  subreddit_from_id: subreddit.id,
                                  subreddit_to_id: adj_sub_record.id,}).empty?
        connection = SubredditConnection.new(
                                subreddit_from_id: subreddit.id,
                                subreddit_to_id: adj_sub_record.id,
                                connection_weight: score)
        connection.save
      else
        connection = SubredditConnection.where({
                                  subreddit_from_id: subreddit.id,
                                  subreddit_to_id: adj_sub_record.id,}).last
        weight = connection.connection_weight
        connection.update(connection_weight: score + weight)
      end
    end
  end

end
