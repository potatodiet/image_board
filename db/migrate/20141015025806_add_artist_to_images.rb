class AddArtistToImages < ActiveRecord::Migration[4.2]
  def change
    add_column :images, :artist, :text
  end
end
