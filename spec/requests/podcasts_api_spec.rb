require "rails_helper"

describe "Podcast API" do
  context "GET /podcasts.json" do

    let!(:podcasts) { podcasts = create_list(:podcast, 10) }

    it "returns the json" do
      get "/podcasts.json"

      expect(response).to be_success

      #TODO: Move to json-validator-schema
      expect(last_response_as_hash.size).to eq 10

      last_response_as_hash.each do |json|
        expect(json[:id]).to_not be_nil
        expect(json[:name]).to_not be_nil
        expect(json[:author]).to_not be_nil
        expect(json[:image]).to_not be_nil
        expect(json[:created_at]).to_not be_nil
        expect(json[:updated_at]).to_not be_nil
      end

    end

  end
end
