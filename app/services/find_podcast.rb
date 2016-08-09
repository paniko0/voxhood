class FindPodcast
  def search(params = {})
    if params['q']
      @podcasts = PodcastCrawler.new.crawl(params['q'])
    else
      content = Content.new
      content.podcasts = Podcast.limit(10)

      @podcasts = content
    end
  end
end
