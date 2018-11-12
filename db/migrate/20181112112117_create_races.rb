class CreateRaces < ActiveRecord::Migration[5.2]
  def change
    create_table :races do |t|
      t.string :name
      t.text :bio
      t.string :image_url

      t.timestamps
    end
  end
end
