require "httparty"

class SubredditApiTest

  def initialize(args = {})
    @agent = ENV["REDDIT_AGENT"]
    @username =  ENV["REDDIT_USERNAME"]
    @password = ENV["REDDIT_PASSWORD"]
    @id = ENV["REDDIT_ID"]
    @secret = ENV["REDDIT_SECRET"]
    @client = args.fetch(:client, HTTParty)
    @after
  end
  attr_reader :agent, :username, :password, :id, :secret, :client, :after

  def about_user(username, param)
    sleep(1)
    headers = {"Authorization" => "bearer #{oath_token}",
               "user-agent" => agent }
    query = {}
    uri = URI.encode("https://oauth.reddit.com/user/#{username}/#{param}.json")
    response = client.get(uri,
                          headers: headers,
                          query: query)
    p response
    return [] if response["error"]
    File.open('about.txt', 'w') { |f| f << response } 
  end

  def oath_token
    basic_auth = { username: id,
                   password: secret }
    headers = { "user-agent" => agent   }
    body = { grant_type:  "password",
             username:  username,
             password: password }
    token_info = client.post("https://www.reddit.com/api/v1/access_token",
                             basic_auth: basic_auth,
                             headers: headers,
                             body: body)
    token_info["access_token"]
  end

end

a = SubredditApiTest.new
a.about_user("popenuj", "downvoted")