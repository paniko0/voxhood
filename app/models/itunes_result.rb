class ItunesResult

  attr_reader :itunes_id, :name, :track_name, :feed_url, :art

  def initialize(json)
    @itunes_id = json.collectionId
    @name = json.artistName
    @track_name = json.trackName
    @feed_url = json.feedUrl
    @art = json.artworkUrl100
  end
end
