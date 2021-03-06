require "rails_helper"

describe ItunesService do
  context "when querying for some podcast" do
    context "and podcast exists" do
      it "returns the object" do
        VCR.use_cassette('ITUNES_SEARCH_TERM_NERDCAST') do
          content = ItunesService.new("nerdcast").get

          expect(content.podcasts[1].itunes_id).to eq 381816509
          expect(content.podcasts[1].name).to eq "Jovem Nerd"
          expect(content.podcasts[1].track_name).to eq "NerdCast"
          expect(content.podcasts[1].feed_url).to eq "https://jovemnerd.com.br/feed-nerdcast/"
          expect(content.podcasts[1].art).to eq "http://is4.mzstatic.com/image/thumb/Music/v4/53/c4/c2/53c4c2b6-60f4-96b7-42d7-f8068b8b4323/source/100x100bb.jpg"
        end
      end
    end

    context "and podcast does not exists" do
      it {
        VCR.use_cassette('ITUNES_SEARCH_TERM_NOTFOUND') do
          expect(ItunesService.new("podcastthatdoesnotexists").get).to be_nil
        end
      }
    end
  end
end
