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
      queue += add_nodes(start_subreddit, limit)
      until queue.empty?
        node = queue.shift
        next if subreddits[node.subreddit.id]
        next if node.subreddit.subscriber_count > 11_000_000
        puts node.subreddit.name
        subreddits[node.subreddit.id] = true
        queue += add_nodes(node.subreddit, limit)
        path_array(node, start_subreddit) if node.subreddit == end_subreddit
      end
    end
    "No path found"
  end

  def add_nodes(subreddit, limit)
    return_array = []
    subreddit.get_top_connections(limit).each do |sub|
      sub_hash = {} 
      sub_hash.subreddit = sub
      sub_hash.parent = subreddit
      return_array.push(sub_hash) 
    end
    return_array
  end

  def path_array(node, start_subreddit)
    current_node = node
    path_array = []
    until  current_node == start_subreddit
      path_array.push(current_node)
      current_node = current_node.parent
    end 
    path_array
  end
end
pf = Pathfinder.new
puts pf.find_path(5, 16, 41)
