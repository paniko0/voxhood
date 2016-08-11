require "rails_helper"

describe "Podcast API" do
  context "GET /podcasts.json" do
    context "without params" do

      let!(:podcasts) { podcasts = create_list(:podcast, 10) }

      it "returns the json" do
        get "/podcasts.json"

        expect(response).to be_success
        expect(response).to match_response_schema("content")

      end

    end

    context "with params" do
      it "returns the json" do
        VCR.use_cassette('ITUNES_SEARCH_WITH_EPISODES_FULL') do
          get "/podcasts.json?q=nerdcast"

          expect(response).to be_success
          expect(response).to match_response_schema("content")

        end
      end
    end

  end
end
