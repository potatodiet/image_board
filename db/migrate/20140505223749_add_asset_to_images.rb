class AddAssetToImages < ActiveRecord::Migration[4.2]
  def change
    change_table(:images) do |t|
      t.remove(:location)
      t.string(:asset)
    end
  end
end
