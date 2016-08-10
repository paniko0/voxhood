class CreateEpisodes < ActiveRecord::Migration[5.0]
  def change
    create_table :episodes do |t|
      t.belongs_to :podcast, index: true
      t.string :entry_id
      t.string :title
      t.string :download_link
      t.string :url
      t.time :duration
      t.datetime :publication_date
      t.text :summary

      t.timestamps
    end
  end
end
