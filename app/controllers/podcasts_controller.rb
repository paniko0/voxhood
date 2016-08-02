class PodcastsController < ApplicationController

  def index
    @podcasts = Podcast.limit(10)

    respond_to do |format|
      format.html
      format.json { render json: @podcasts.to_json }
    end
  end

end
