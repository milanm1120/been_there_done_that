class AddUidToUsersTable < ActiveRecord::Migration[6.1]
  def change
    add_column :users_tables, :uid, :string
  end
end
