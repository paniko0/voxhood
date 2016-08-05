require 'rails_helper'

RSpec.describe Podcast, type: :model do
  context "#last_episodes" do

    subject(:podcast) { Podcast.new( itunes_id: "123", name: "Bla", track_name: "Bla", feed_url: "https://jovemnerd.com.br/feed-nerdcast/", art: "http://" ) }

    it "returns last three episodes" do
      last_episodes = subject.last_episodes

      expect(last_episodes[0].title).to eq "NerdCast 527 - Action figures, bonecos e hominhos"
      expect(last_episodes[1].title).to eq "Empreendedor 19 - 5 admiráveis inovações"
      expect(last_episodes[2].title).to eq "NerdCast 526 - A revolução buffada dos eSports"
    end
  end
end
