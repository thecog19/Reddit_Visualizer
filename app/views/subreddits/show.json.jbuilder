json.id @subreddit.id
json.name @subreddit.name
json.subscriber_count @subreddit.subscriber_count
json.description @subreddit.description
json.url @subreddit.url
json.subreddit_icon @subreddit.subreddit_icon
json.nsfw @subreddit.nsfw

json.children @children do |child|
  json.id child.id
  json.name child.name
  json.url child.url
  json.description child.description
  json.subscriber_count child.subscriber_count
  json.connection_weight child.get_weight(@subreddit.id)
  json.subreddit_icon child.subreddit_icon
  json.nsfw child.nsfw
end
