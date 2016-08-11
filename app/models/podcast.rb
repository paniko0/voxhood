class Podcast < ApplicationRecord

  has_many :episodes

  def last_episodes(limit = 3)
    self.episodes.order(publication_date: :desc).limit(limit)
  end

end
