class AddSlugToCharacter < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :slug, :string
  end
end
