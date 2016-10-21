class AddDescriptionToPodcast < ActiveRecord::Migration[5.0]
  def change
    add_column :podcasts, :description, :string
  end
end
