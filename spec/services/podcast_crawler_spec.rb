require "rails_helper"

describe PodcastCrawler do
  context "when searches for a podcast" do
    context "and something was found" do
      it "returns PodcastSerializer object" do
        podcast_serializer = PodcastCrawler.new.crawl("nerdcast")

        expect(podcast_serializer).to be_a PodcastSerializer
      end
    end
  end
end
