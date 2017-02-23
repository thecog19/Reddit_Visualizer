class Pathfinder
  Node = Struct.new("Node",:parent, :subreddit)

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

    queue.push(build_node(start_subreddit.id))
    until queue.empty?
      node = queue.shift
      next if valid_node?(node['subreddit'])
      queue += add_nodes(node, limit)
      return create_path(node, start_subreddit) if node['subreddit'] == end_subreddit
    end
    false
  end

  def valid_node?(node_id)
    return true if @visited_subreddits[node_id]
    @visited_subreddits[node_id] = true
    false
  end

  def add_nodes(node, limit)
    node_list = []
    if node.class != Struct::Node
      node = build_node(node.id)
    end
    puts node
    Subreddit.find_by(id: node.subreddit).related_subreddits(limit).each do |sr|
      next unless sr
      node_list.push(build_node(sr.id, node))
    end
    node_list
  end

  def build_node(subreddit, parent = nil)
    n = Node.new(subreddit: subreddit, parent: parent)
    puts "this is the node #{n} with #{parent}, and #{subreddit}"
    n
  end

  def create_path(node, start_subreddit)
    current_node = node
    path = []
    until  current_node["subreddit"] == start_subreddit
      path.unshift(current_node["subreddit"])
      current_node = current_node["parent"]
    end
    path.unshift(current_node["subreddit"])
    path.map do |node_id|
      Subreddit.find_by(id: node_id)
    end
  end
end
