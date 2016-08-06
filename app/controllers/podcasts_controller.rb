class PodcastsController < ApplicationController

  def index
    if params['q']
      @podcasts = PodcastCrawler.new.crawl(params['q'])
    else
      content = Content.new
      content.podcasts = Podcast.limit(10)

      @podcasts = content
    end

    respond_to do |format|
      format.html
      format.json { render json: @podcasts.to_json }
    end
  end

end
