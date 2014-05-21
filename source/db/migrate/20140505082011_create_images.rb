class CreateImages < ActiveRecord::Migration
  def change
    create_table(:images) do |t|
      t.text(:location)
      t.integer(:owner)

      t.timestamps
    end
  end
end
