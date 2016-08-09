class PodcastsController < ApplicationController

  def index
    @podcasts = FindPodcast.new.search(params)

    respond_to do |format|
      format.html
      format.json { render json: @podcasts, serializer: ContentSerializer }
    end
  end

end
