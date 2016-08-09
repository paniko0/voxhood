require "rails_helper"

describe FindPodcast do
  describe "#search" do
    context "when request has q param" do

      it "craws podcast" do
        VCR.use_cassette('ITUNES_SEARCH_WITH_EPISODES') do
          expect_any_instance_of(PodcastCrawler).to receive(:crawl).once.with("nerdcast")

          described_class.new.search({'q' => "nerdcast"})
        end
      end
    end

    context "when request has no param" do
      it "get last 10 episodes" do

        expect_any_instance_of(PodcastCrawler).to_not receive(:crawl).once.with("nerdcast")
        expect(Podcast).to receive(:limit).once.with(10)

        expect(described_class.new.search).to be_a Content
      end
    end
  end
end
