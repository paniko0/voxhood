require "rails_helper"

describe "Podcast API" do
  context "GET /podcasts.json" do
    context "without params" do

      let!(:podcasts) { podcasts = create_list(:podcast, 10) }

      it "returns the json" do
        get "/podcasts.json"

        expect(response).to be_success

        #TODO: Move to json-validator-schema
        expect(last_response_as_hash[:podcasts].size).to eq 10
        expect(last_response_as_hash[:podcasts][0][:id]).to_not be_nil
        expect(last_response_as_hash[:podcasts][0][:itunes_id]).to_not be_nil
        expect(last_response_as_hash[:podcasts][0][:name]).to_not be_nil
        expect(last_response_as_hash[:podcasts][0][:track_name]).to_not be_nil
        expect(last_response_as_hash[:podcasts][0][:feed_url]).to_not be_nil
        expect(last_response_as_hash[:podcasts][0][:art]).to_not be_nil
        expect(last_response_as_hash[:podcasts][0][:created_at]).to_not be_nil
        expect(last_response_as_hash[:podcasts][0][:updated_at]).to_not be_nil

      end

    end

    context "with params" do
      it "returns the json" do
        VCR.use_cassette('ITUNES_SEARCH_WITH_EPISODES') do
          get "/podcasts.json?q=nerdcast"

          expect(response).to be_success

          #TODO: Move to json-validator-schema
          expect(last_response_as_hash[:podcasts].size).to eq 35
          expect(last_response_as_hash[:podcasts][0][:id]).to_not be_nil
          expect(last_response_as_hash[:podcasts][0][:itunes_id]).to_not be_nil
          expect(last_response_as_hash[:podcasts][0][:name]).to_not be_nil
          expect(last_response_as_hash[:podcasts][0][:track_name]).to_not be_nil
          expect(last_response_as_hash[:podcasts][0][:feed_url]).to_not be_nil
          expect(last_response_as_hash[:podcasts][0][:art]).to_not be_nil
          expect(last_response_as_hash[:podcasts][0][:created_at]).to_not be_nil
          expect(last_response_as_hash[:podcasts][0][:updated_at]).to_not be_nil
        end
      end
    end

  end
end
