class ItunesService
  include HTTParty
  base_uri 'https://itunes.apple.com'

  def initialize(query)
    @options = { query: {term: query } }
  end

  def get
    result = self.class.get("/search", @options)
    json = JSON.parse(result, symbolize_names: true)

    return build_object(json) if json[:resultCount] > 0

    nil
  end

  private
    def build_object(json)
      content = Content.new

      json[:results].each do |result|
        content.podcasts << CreatePodcast.create(result)
      end

      return content
    end
end
