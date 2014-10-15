class AddArtistToImages < ActiveRecord::Migration
  def change
    add_column :images, :artist, :text
  end
end
