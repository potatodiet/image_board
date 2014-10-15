class AddAssetToImages < ActiveRecord::Migration
  def change
    change_table(:images) do |t|
      t.remove(:location)
      t.string(:asset)
    end
  end
end
