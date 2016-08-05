class Podcast < ApplicationRecord

  def last_episodes(limit = 2)
    arr = []

    feed = Feedjira::Feed.fetch_and_parse feed_url
    feed.entries.each_with_index do |episode, index|
      arr << episode

      break if index == limit
    end

    return arr
  end

end
