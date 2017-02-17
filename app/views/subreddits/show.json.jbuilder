json.id @subreddit.id
json.name @subreddit.name
json.subscriber_count @subreddit.subscriber_count
json.description @subreddit.description
json.url @subreddit.url
json.subreddit_icon @subreddit.subreddit_icon

json.children @children do |child|
  json.id child.id
  json.name child.name
  json.url child.url
  json.description child.description
  json.subscriber_count child.subscriber_count
  # json.active_users @children.active_user
  json.connection_weight child.get_weight(@subreddit.id)
  json.subreddit_icon child.subreddit_icon
end
