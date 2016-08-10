class ContentSerializer < ActiveModel::Serializer
  has_many :podcasts, include: [:episodes]
end
