class AddSourceToImages < ActiveRecord::Migration
  def change
    add_column :images, :source, :text
  end
end
