class Pathfinder
  def find_path(limit, id_start, id_end)
    start_subreddit = Subreddit.find_by(id: id_start)
    end_subreddit = Subreddit.find_by(id: id_end)

    subreddits = {}
    queue = []
    path = []

    subreddits[id_start] = true
    unless end_subreddit
      'Node does not exist'
    else
      queue += start_subreddit.get_top_connections(limit)
      until queue.empty?
        node = queue.shift
        next if subreddits[node.id]
        next if node.subscriber_count > 11_000_000
        puts node.name
        subreddits[node.id] = true
        queue += node.get_top_connections(limit)
        return if node == end_subreddit
      end
    end
  end
end
pf = Pathfinder.new
puts pf.find_path(5, 16, 41)
