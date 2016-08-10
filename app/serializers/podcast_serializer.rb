class PodcastSerializer < ActiveModel::Serializer
  has_many :episodes do
    Episode.where(podcast: object).limit(3)
  end

  attributes :id, :itunes_id, :name, :track_name, :feed_url, :art
end
