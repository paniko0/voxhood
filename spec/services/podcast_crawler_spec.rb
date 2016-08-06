require "rails_helper"

describe PodcastCrawler do
  context "when searches for a podcast" do
    context "and something was found" do
      it "returns PodcastSerializer object" do
        VCR.use_cassette('ITUNES_SEARCH_WITH_EPISODES') do
          content = PodcastCrawler.new.crawl("nerdcast")

          expect(content).to be_a Content
          expect(content.podcasts.size).to eq 35
          expect(content.podcasts[1].last_episodes.size).to eq 3
        end
      end
    end
  end
end
