require "rails_helper"

describe ItunesResult do
  context "#last_episodes" do
    let!(:itunes_info) { return OpenStruct.new({ collectionId: 123, artistName: "Bla", trackName: "Bla", feedUrl: "https://jovemnerd.com.br/feed-nerdcast/"}) }

    it "returns last three episodes" do
      last_episodes = ItunesResult.new(itunes_info).last_episodes

      expect(last_episodes[0].title).to eq "NerdCast 527 - Action figures, bonecos e hominhos"
      expect(last_episodes[1].title).to eq "Empreendedor 19 - 5 admiráveis inovações"
      expect(last_episodes[2].title).to eq "NerdCast 526 - A revolução buffada dos eSports"
    end
  end
end
