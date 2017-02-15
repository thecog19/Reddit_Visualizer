json.id @subreddit.id
json.name @subreddit.name
json.subscriber_count @subreddit.subscriber_count

json.children @children do |child|
  json.id child.id
  json.name child.name
  json.subscriber_count child.subscriber_count
  # json.active_users @children.active_user
  json.connection_weight child.get_weight(@subreddit.id)
end
