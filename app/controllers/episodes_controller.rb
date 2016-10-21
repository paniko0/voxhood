class EpisodesController < ApplicationController
  before_action :load_podcast, only: [:index]

  def index
  end

  def load_podcast
    @podcast = Podcast.find(params[:podcast_id])
  end
end
