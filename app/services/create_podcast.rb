class CreatePodcast
  def self.create(params)

    podcast = Podcast.where(itunes_id: params[:collectionId]).first_or_create do |new_podcast|
      new_podcast.name = params[:artistName]
      new_podcast.track_name = params[:trackName]
      new_podcast.feed_url = params[:feedUrl]
      new_podcast.art = params[:artworkUrl100]
    end

    GetEpisodesJob.perform_later podcast

    podcast
  end
end
