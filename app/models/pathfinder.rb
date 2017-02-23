class Pathfinder
  def find_path(start_subreddit, end_subreddit, limit=5)
    return if start_subreddit == end_subreddit

    unless end_subreddit
      'Node does not exist'
    else
      return search_subreddits(start_subreddit, end_subreddit, limit)
    end
  end

  def search_subreddits(start_subreddit, end_subreddit, limit)
    @visited_subreddits = {}
    queue = []

    queue.push(build_node(start_subreddit))
    until queue.empty?
      node = queue.shift
      next if valid_node?(node['subreddit'], start_subreddit.id, end_subreddit.id)
      queue += add_nodes(node, limit)
      return create_path(node, start_subreddit) if node['subreddit'] == end_subreddit
    end
    'No path found'
  end

  def valid_node?(node, start_id, end_id)
    if @visited_subreddits[node.id]
      return true
    elsif node.subscriber_count > 11_000_000 && (node.id != start_id && node.id != end_id)
      return true
    end
    @visited_subreddits[node.id] = true
    false
  end

  def add_nodes(subreddit, limit)
    node_list = []
    if subreddit.class != Hash
      build_node(subreddit)
    end
    subreddit["subreddit"].get_top_connections(limit).each do |sr|
      next unless sr
      node_list.push(build_node(sr, subreddit))
    end
    node_list
  end

  def build_node(subreddit, parent = nil)
    subreddit_temp = {}
    subreddit_temp["subreddit"] = subreddit
    subreddit_temp["parent"] = parent
    subreddit = subreddit_temp
  end

  def create_path(node, start_subreddit)
    current_node = node
    path = []
    until  current_node["subreddit"].id == start_subreddit.id
      path.unshift(current_node["subreddit"])
      current_node = current_node["parent"]
    end
    path.unshift(current_node["subreddit"])
  end
end
