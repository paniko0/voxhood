class EpisodeSerializer < ActiveModel::Serializer
  attributes :title, :entry_id, :download_link, :summary
end
