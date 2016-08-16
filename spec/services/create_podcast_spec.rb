require "rails_helper"

describe CreatePodcast do
  context ".create" do
    let(:podcast) { create(:podcast) }
    subject(:create_podcast) { described_class.create({collectionId: podcast.itunes_id}) }

    it "enqueues" do
      expect(GetEpisodesJob).to receive(:perform_later)

      create_podcast
    end

    context "when podcast exists in database" do

      let!(:podcast) { create(:podcast) }

      it "retrieves podcast" do
        expect{
          subject
        }.to_not change(Podcast, :count)
      end

    end

    context "when podcast dpes not exists in database" do

      it "retrieves podcast" do
        expect{
          subject
        }.to change(Podcast, :count).by(1)
      end

    end
  end
end
