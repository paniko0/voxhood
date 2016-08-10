require 'rails_helper'

RSpec.describe PodcastsController, type: :controller do
  include ActiveModelSerializers::Test::Serializer
  
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
      it "shows podcast info" do
        get :index, format: :json

        assert_serializer ContentSerializer
        expect(response.content_type).to eq("application/json")
      end
    end

  end
end
