class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :fristname
      t.string :lastname
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
 