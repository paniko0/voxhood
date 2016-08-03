class ItunesService
  include HTTParty
  base_uri 'https://itunes.apple.com'

  def initialize(query)
    @options = { query: {term: query } }
  end

  def get
    result = self.class.get("/search", @options)
    json = JSON.parse(result, object_class: OpenStruct)
    if json.resultCount > 0
      # TODO: should we parse this or return json directly?
      return build_object(json)
    end

    nil
  end

  private
    def build_object(json)
      arr = []
      json.results.each do |result|
        arr << ItunesResult.new(result)
      end

      return arr
    end
end
