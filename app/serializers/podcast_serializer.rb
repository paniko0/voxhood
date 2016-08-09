class PodcastSerializer < ActiveModel::Serializer
  attributes :id, :itunes_id, :name, :track_name, :feed_url, :art

  has_many :episodes
end
