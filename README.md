
# Reddit Visualizer

The Reddit Visualizer application will allow you to explore connections between your favorite subreddits and see real world data gathered from Reddit in action!

See it live [on heroku](https://reddit-visualizer.herokuapp.com/).

![ss](public/screenshot.png?raw=true "Screenshot of project")

## Using the Deployed Application
1. Visit [the Reddit Visualizer](https://reddit-visualizer.herokuapp.com/)
2. Search for your desired subreddit using the search bar or start exploring from the default subreddit (AskReddit).
3. Click on subreddit nodes to expand that subreddit to see its connections.
  - Line weight represents connection strength
  - Node size represents subscribed members
  - Explanation of node colors is in legend in the bottom left-hand corner
4. To find a path between two subreddits type a starting subreddit into the first search field and a destination subreddit into the second input, or simply search from the second input and use the current subreddit as the starting point.
5. Use the "Expand subreddits" button to expand all nodes currently visible that have connections.

## To run the application locally
1. Clone this repository to your local machine.
2. View our custom [Reddit API Gem](https://github.com/anthonyfuentes/reddit_api) for instructions on how to set up your application for data gathering.
3. Run `bundle install` from your terminal.
4. Create a database by running `rails db:create` in your terminal.
5. Run migrations with `rails db:migrate` from your terminal.
6. Gather subreddits to start building connections by running `rake reddit:gather_subreddits` in your terminal.
7. Start building subreddit connections by running `rake reddit:form_connections` in your terminal.
8. Run a server from your terminal using `rails s` and visit localhost:3000 in your browser.
  - Note: If you haven't allowed sufficient time for data collection you may not have much data to view initially.

# Highlights

- [D3.js](https://d3js.org/) for interactive, physics-driven data visualization
- [Reddit API](https://www.reddit.com/dev/api/) for all the data collection
- [Rails](http://rubyonrails.org/) and Postgres for API interaction and data storage
- [Rspec](http://rspec.info/) for back end unit testing
