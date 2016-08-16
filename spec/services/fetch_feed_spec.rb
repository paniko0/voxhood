require "rails_helper"

describe FetchFeed do
  context "#fetch" do

    context "when episode exists" do

      let(:podcast) { create(:podcast, feed_url: "https://jovemnerd.com.br/feed-nerdcast/") }
      subject(:fetcher) { FetchFeed.new(podcast).fetch }

      it "appends to podcast" do
        VCR.use_cassette("NERDCAST_EPISODES") do
          expect{subject}.to change(Episode, :count).by(568)
        end
      end
    end

    context "do nothing when episode exists" do

    end

    context "when some error parsing episode" do

    end

  end
end
