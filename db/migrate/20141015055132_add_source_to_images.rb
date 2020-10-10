class AddSourceToImages < ActiveRecord::Migration[4.2]
  def change
    add_column :images, :source, :text
  end
end
