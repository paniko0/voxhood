require 'rails_helper'

RSpec.describe PodcastsController, type: :controller do
  describe "GET #index" do
    it "shows most played podcasts" do
      podcasts = create_list(:podcast, 10)
      get :index
      expect(assigns(:podcasts)).to eq(podcasts)
    end
  end
end
