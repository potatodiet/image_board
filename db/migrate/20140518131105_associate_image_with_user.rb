class AssociateImageWithUser < ActiveRecord::Migration
  def change
    change_table(:images) do |t|
      t.remove(:owner)
      t.integer(:uploader_id)
    end
  end
end
