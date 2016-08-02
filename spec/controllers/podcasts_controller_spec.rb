require 'rails_helper'

RSpec.describe PodcastsController, type: :controller do
  describe "GET #index" do

    let!(:podcasts) { podcasts = create_list(:podcast, 10) }

    context "html response" do
      it "shows most played podcasts" do
        get :index
        expect(assigns(:podcasts)).to eq(podcasts)
      end
    end

    context "json response" do
      it "shows most played podcasts" do
        get :index, format: :json
        expect(assigns(:podcasts)).to eq(podcasts)
      end
    end

  end
end
