class CreatePodcast
  def self.create(params)
    podcast = Podcast.where(itunes_id: params[:collectionId]).first_or_create do |podcast|
      podcast.name = params[:artistName]
      podcast.track_name = params[:trackName]
      podcast.feed_url = params[:feedUrl]
      podcast.art = params[:artworkUrl100]
    end

    GetEpisodesJob.perform_later podcast

    podcast
  end
end
