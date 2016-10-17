class GetEpisodesJob < ActiveJob::Base
  queue_as :get_episodes

  rescue_from(StandardError) do |exception|
    Rails.logger.error "An exception happend #{exception.message}"
  end

  def perform(podcast)
    FetchFeed.new(podcast).fetch
  end
end
