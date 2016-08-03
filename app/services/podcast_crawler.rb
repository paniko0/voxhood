class PodcastCrawler

  def crawl(query)
    itunes_info = ItunesService.new(query).get
  end
end
