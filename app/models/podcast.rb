class Podcast < ApplicationRecord

  after_create :get_episodes

  has_many :episodes

  def last_episodes(limit = 3)
    self.episodes.limit(limit)
  end

  private
    def get_episodes
      GetEpisodesJob.perform_later self
    end

end
