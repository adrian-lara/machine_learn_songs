class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :access_token
      t.string :refresh_token
      t.string :token_type

      t.timestamps
    end
  end
end
