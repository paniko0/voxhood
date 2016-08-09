require 'rails_helper'

RSpec.describe PodcastsController, type: :controller do
  describe "GET #index" do

    let!(:podcasts) { create_list(:podcast, 10) }
    let!(:content) do
       content = Content.new
       content.podcasts = podcasts
       content
    end

    context "html response" do
      it "shows most played podcasts" do
        get :index
        expect(assigns(:podcasts)).to be_kind_of Content
      end
    end

    context "json response" do
      it "shows most played podcasts" do
        get :index, format: :json

        # it MUST be a better way to do this
        expect(response.body).to_not be_nil
        expect(response.content_type).to eq("application/json")
      end
    end

  end
end
