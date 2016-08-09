class GetEpisodesJob < ApplicationJob
  queue_as :get_episodes

  def perform(*podcast)
    puts "====================== #{podcast}"
    # feed = Feedjira::Feed.fetch_and_parse podcast.feed_url
    # feed.entries.each do |episode|
    #   podcast.episodes << Episode.new(entry_id: episode.entry_id, title: episode.title, download_link: episode.enclosure_url, url: episode.url, duration: episode.itunes_duration, publication_date: episode.published, summary: episode.summary)
    # end
  end
end
