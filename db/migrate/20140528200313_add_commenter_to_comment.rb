class AddCommenterToComment < ActiveRecord::Migration[4.2]
  def change
    change_table(:comments) do |t|
      t.integer(:commenter_id)
    end
  end
end
