require 'rails_helper'

RSpec.describe GetEpisodesJob, type: :job do

  after do
    clear_enqueued_jobs
    clear_performed_jobs
  end

  let(:podcast) { create(:podcast, feed_url: "https://jovemnerd.com.br/feed-nerdcast/") }
  subject(:job) { described_class.perform_later(podcast) }

  it 'queues the job' do
    expect { job }
      .to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it 'handles any exception' do
    allow_any_instance_of(FetchFeed).to receive(:fetch).and_raise(StandardError)

    expect { GetEpisodesJob }.to_not raise_error(StandardError)
  end

end
