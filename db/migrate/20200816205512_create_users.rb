class CreateUsers < ActiveRecord::Migration[5.2]

  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_disgest
      t.integer :playlist_id
    end
  end

end
