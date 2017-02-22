class Pathfinder
  def find_path(limit, id_start, id_end)
    return if id_start == id_end
    start_subreddit = Subreddit.find_by(id: id_start)
    end_subreddit = Subreddit.find_by(id: id_end)

    subreddits = {}
    queue = []
    path = []

    unless end_subreddit
      'Node does not exist'
    else
      queue.push(build_node(start_subreddit))
      until queue.empty?
        node = queue.shift
        next if subreddits[node["subreddit"].id]
        next if node["subreddit"].subscriber_count > 11_000_000 &&
        (node["subreddit"].id != start_subreddit.id && node["subreddit"].id != end_subreddit.id)
        subreddits[node["subreddit"].id] = true
        queue += add_nodes(node, limit)
        return path_array(node, start_subreddit) if node["subreddit"] == end_subreddit
      end
    end
    "No path found"
  end

  def build_node(subreddit, parent = nil)
    subreddit_temp = {}
    subreddit_temp["subreddit"] = subreddit
    subreddit_temp["parent"] = nil
    subreddit = subreddit_temp
  end

  def add_nodes(subreddit, limit)
    return_array = []
    if subreddit.class != Hash
      build_node(subreddit)
    end
    # pass to build_node method
    subreddit["subreddit"].get_top_connections(limit).each do |sr|
      next unless sr
      return_array.push(build_node(sr, subreddit))
    end
    return_array
  end

  def path_array(node, start_subreddit)
    current_node = node
    path_array = []
    until  current_node["subreddit"].id == start_subreddit.id
      path_array.push(current_node["subreddit"].name)
      current_node = current_node["parent"]
    end
    path_array
  end
end
pf = Pathfinder.new
puts pf.find_path(5, 1, 1)
