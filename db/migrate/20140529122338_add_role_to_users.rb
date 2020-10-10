class AddRoleToUsers < ActiveRecord::Migration[4.2]
  def change
    change_table(:users) do |t|
      t.string(:role, :default => :regular)
    end
  end
end
