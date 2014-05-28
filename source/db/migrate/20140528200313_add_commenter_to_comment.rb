class AddCommenterToComment < ActiveRecord::Migration
  def change
    change_table(:comments) do |t|
      t.integer(:commenter_id)
    end
  end
end
