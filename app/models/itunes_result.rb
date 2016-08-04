class ItunesResult

  attr_reader :itunes_id, :name, :track_name, :feed_url, :art

  def initialize(json)
    @itunes_id = json.collectionId
    @name = json.artistName
    @track_name = json.trackName
    @feed_url = json.feedUrl
    @art = json.artworkUrl100
  end

  def last_episodes
    arr = []

    feed = Feedjira::Feed.fetch_and_parse feed_url
    feed.entries.each_with_index do |episode, index|
      arr << episode

      break if index == 2
    end

    return arr
  end
end
