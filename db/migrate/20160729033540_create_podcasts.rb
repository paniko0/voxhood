class CreatePodcasts < ActiveRecord::Migration[5.0]
  def change
    create_table :podcasts do |t|
      t.string :name
      t.string :author
      t.string :image
      
      t.timestamps
    end
  end
end
