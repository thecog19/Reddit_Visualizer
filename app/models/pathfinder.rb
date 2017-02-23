class Pathfinder
  def find_path(start_subreddit, end_subreddit, limit=5)
    return if start_subreddit == end_subreddit

    if end_subreddit
      search_subreddits(start_subreddit, end_subreddit, limit)
    else
      false
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
    false
  end

  def valid_node?(node, start_id, end_id)
    return true if @visited_subreddits[node.id]
    @visited_subreddits[node.id] = true
    false
  end

  def add_nodes(subreddit, limit)
    node_list = []
    if subreddit.class != Hash
      build_node(subreddit)
    end
    subreddit["subreddit"].related_subreddits(limit).each do |sr|
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
