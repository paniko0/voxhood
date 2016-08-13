class PodcastCrawler

  def crawl(query)
    ItunesService.new(query).get
  end
end
