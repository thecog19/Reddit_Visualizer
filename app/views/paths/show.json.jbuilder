json.subreddits @path do |subreddit|  
  json.id subreddit.id
  json.name subreddit.name
  json.subscriber_count subreddit.subscriber_count
  json.description subreddit.description
  json.url subreddit.url
  json.icon subreddit.icon
  json.nsfw subreddit.nsfw
  json.has_children subreddit.has_children

  json.children subreddit.get_top_connections(5) do |child|
    json.id child.id
    json.name child.name
    json.url child.url
    json.description child.description
    json.subscriber_count child.subscriber_count
    json.connection_weight child.get_weight(subreddit.id)
    json.icon child.icon
    json.nsfw child.nsfw
    json.has_children child.has_children
  end
end