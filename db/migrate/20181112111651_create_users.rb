class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.integer :age
      t.string :image_url
      t.string :password_digest

      t.timestamps
    end
  end
end
