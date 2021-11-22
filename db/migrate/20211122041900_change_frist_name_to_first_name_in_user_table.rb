class ChangeFristNameToFirstNameInUserTable < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :fristname, :firstname
  end
end
