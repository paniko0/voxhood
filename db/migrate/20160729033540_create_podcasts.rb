class CreatePodcasts < ActiveRecord::Migration[5.0]
  def change
    create_table :podcasts do |t|
      t.integer :itunes_id, limit: 8
      t.string :name
      t.string :track_name
      t.string :feed_url
      t.string :art

      t.timestamps
    end
  end
end
