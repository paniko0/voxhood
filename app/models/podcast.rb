class Podcast < ApplicationRecord

  has_many :episodes

  def last_episodes(limit = 3)
    self.episodes.limit(limit)
  end

end
