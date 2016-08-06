class Podcast < ApplicationRecord

  def last_episodes(limit = 3)
    arr = []

    feed = Feedjira::Feed.fetch_and_parse feed_url
    feed.entries.each_with_index do |episode, index|
      arr << episode

      break if index == (limit - 1)
    end

    return arr
  end

end
