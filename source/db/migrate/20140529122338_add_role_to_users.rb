class AddRoleToUsers < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      t.string(:role, :default => :regular)
    end
  end
end
