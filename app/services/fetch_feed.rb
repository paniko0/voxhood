class FetchFeed
  attr_reader :podcast

  def initialize(podcast)
    @podcast = podcast
  end

  def fetch
    feed = Feedjira::Feed.fetch_and_parse podcast.feed_url
    feed.entries.each do |episode|
      unless Episode.exists?(entry_id: episode.entry_id)
        podcast.episodes << Episode.new(entry_id: episode.entry_id, title: episode.title, download_link: episode.enclosure_url, url: episode.url, duration: episode.itunes_duration, publication_date: episode.published, summary: episode.summary)
      else
        Rails.logger.info "episode #{episode.entry_id} already exists"
      end
    end
  rescue Mysql2::Error => ex
    if ex.message == "Incorrect datetime value"
      podcast.episodes << Episode.new(entry_id: episode.entry_id, title: episode.title, download_link: episode.enclosure_url, url: episode.url, duration: episode.itunes_duration, publication_date: DateTime.now, summary: episode.summary)
    end
  end

  private
    def datetime(episode)
      Datetime.new(episode.published)
    end
end
