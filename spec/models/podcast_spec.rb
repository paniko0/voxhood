require 'rails_helper'

RSpec.describe Podcast, type: :model do
  context "#last_episodes" do

    subject(:podcast) { Podcast.new( itunes_id: "123", name: "Bla", track_name: "Bla", feed_url: "https://jovemnerd.com.br/feed-nerdcast/", art: "http://" ) }

    it "returns last three episodes when no param informed" do
      VCR.use_cassette('NERDCAST_EPISODES') do
        last_episodes = subject.last_episodes

        expect(last_episodes.size).to eq(3)
        expect(last_episodes[0].title).to eq "NerdCast 527 - Action figures, bonecos e hominhos"
        expect(last_episodes[1].title).to eq "Empreendedor 19 - 5 admiráveis inovações"
        expect(last_episodes[2].title).to eq "NerdCast 526 - A revolução buffada dos eSports"
      end
    end

    it "returns last two episodes when param informed" do
      VCR.use_cassette('NERDCAST_EPISODES') do
        last_episodes = subject.last_episodes 2

        expect(last_episodes.size).to eq(2)
        expect(last_episodes[0].title).to eq "NerdCast 527 - Action figures, bonecos e hominhos"
        expect(last_episodes[1].title).to eq "Empreendedor 19 - 5 admiráveis inovações"
      end
    end

    it "returns last five episodes when param informed" do
      VCR.use_cassette('NERDCAST_EPISODES') do
        last_episodes = subject.last_episodes 5

        expect(last_episodes.size).to eq(5)
        expect(last_episodes[0].title).to eq "NerdCast 527 - Action figures, bonecos e hominhos"
        expect(last_episodes[1].title).to eq "Empreendedor 19 - 5 admiráveis inovações"
        expect(last_episodes[2].title).to eq "NerdCast 526 - A revolução buffada dos eSports"
        expect(last_episodes[3].title).to eq "NerdCast 525 - A Ciência do Humor"
        expect(last_episodes[4].title).to eq "NerdCast 524 - WWII: Guerra no Pacífico"
      end
    end
  end
end
