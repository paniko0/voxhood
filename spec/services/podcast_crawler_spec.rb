require "rails_helper"

describe PodcastCrawler do
  context "searches on itunes" do
    it "returns PodcastSerializer object" do
      expect_any_instance_of(ItunesService).to receive(:get).once

      content = PodcastCrawler.new.crawl("nerdcast")
    end
  end
end
