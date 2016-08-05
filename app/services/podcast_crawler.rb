class PodcastCrawler

  def crawl(query)
    content = ItunesService.new(query).get
  end
end
