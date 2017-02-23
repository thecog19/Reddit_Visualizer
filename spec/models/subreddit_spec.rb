require "rails_helper"

describe Subreddit, :vcr do

  it { is_expected.to have_many(:subreddit_origin_connections) }
  it { is_expected.to have_many(:origin_subreddits) }
  it { is_expected.to have_many(:subreddit_destination_connections) }
  it { is_expected.to have_many(:destination_subreddits) }

  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:url) }
  it { is_expected.to validate_presence_of(:url) }

  describe "#related_subreddits" do
    it "returns n subreddit connections" do
      subreddit = build(:subreddit, :with_connections)

      subreddits = subreddit.related_subreddits(2)

      expect(subreddits.length).to eq(2)
    end

    it "returns SubredditConnections" do
      subreddit = build(:subreddit, :with_connections)

      subreddits = subreddit.related_subreddits(2)
      all_subreddits = subreddits.all? { |s| s.is_a?(Subreddit) }

      expect(all_subreddits).to be true
    end

    it "returns the most related subreddits first" do
      subreddit = create(:subreddit)
      subreddit_to_strong = create(:subreddit)
      subreddit_to_weak = create(:subreddit)
      strong_connection = create(:subreddit_connection, 
                                connection_weight: 100, 
                                subreddit_from: subreddit, 
                                subreddit_to: subreddit_to_strong)
      weak_connection = create(:subreddit_connection, 
                                connection_weight: 1, 
                                subreddit_from: subreddit, 
                                subreddit_to: subreddit_to_weak)

      subreddits = subreddit.related_subreddits(1)

      expect(subreddits.first).to eq(subreddit_to_strong)
    end
  end

  describe "#get_weight" do
    it "returns a connection weight for a specific subreddit" do 
      subreddit = create(:subreddit)
      subreddit_connected = create(:subreddit)
      connection = create(:subreddit_connection, 
                          connection_weight: 10,
                          subreddit_from: subreddit_connected,
                          subreddit_to: subreddit)

      weight = subreddit.get_weight(subreddit_connected.id)

      expect(weight).to eq(connection.connection_weight)
    end
  end
 
  describe "#has_children" do
    it "returns true if the subreddit has children" do 
      subreddit = create(:subreddit, :with_connections)
 
      has_children = subreddit.has_children

      expect(has_children).to be true 
    end

    it "returns false if it does not have children" do 
      subreddit = create(:subreddit)
 
      has_children = subreddit.has_children

      expect(has_children).to be false 
    end
  end

  describe ".find_or_fetch_by_name" do
    context "subreddit exists" do
      it "returns the subreddit with the given name" do
        subreddit = create(:subreddit)

        returned_subreddit = Subreddit.find_or_fetch_by_name(subreddit.name)

        expect(returned_subreddit).to eq(subreddit)
      end
    end

    context "it creates a new subreddit if none exists" do

      it "sends a call to the API to get subreddit data" do
        subreddit_api = double()
        subreddit_name = "MockName"
        api_return = RedditApi::Subreddit.new("display_name" => subreddit_name)
        expect(subreddit_api).to receive(:data_for)
        .with(subreddit_name)
        .and_return(api_return)
        Subreddit.find_or_fetch_by_name(subreddit_name, subreddit_api)
      end

      it "creates the subreddit" do
        subreddit_name = "politics"
        
        expect{
          Subreddit.find_or_fetch_by_name(subreddit_name)
          }.to change{Subreddit.count}.by(1)
      end

      it "returns the new subreddit" do
        subreddit_name = "math"

        new_subreddit = Subreddit.find_or_fetch_by_name(subreddit_name)

        expect(new_subreddit.name).to eq(subreddit_name)
      end
    end
  end

  describe ".find_by_id_or_name" do
    context "params id equals '0'" do
      it "returns the correct subreddit" do
        subreddit = create(:subreddit)
        params = {id: "0", name: subreddit.name}

        returned_subreddit = Subreddit.find_by_id_or_name(params)

        expect(returned_subreddit).to eq(subreddit)
      end
    end

    context "params with id not '0'" do
      it "returns the correct subreddit" do
        subreddit = create(:subreddit)
        params = {id: subreddit.id}

        returned_subreddit = Subreddit.find_by_id_or_name(params)

        expect(returned_subreddit).to eq(subreddit)
      end
    end
  end

end
