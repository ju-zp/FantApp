class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.references :user
      t.string :gender
      t.references :race

      t.timestamps
    end
  end
end
