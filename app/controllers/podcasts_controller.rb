class PodcastsController < ApplicationController

  def index
    @podcasts = Podcast.limit(10).to_a
  end

end
