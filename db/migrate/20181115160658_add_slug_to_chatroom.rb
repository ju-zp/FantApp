class AddSlugToChatroom < ActiveRecord::Migration[5.2]
  def change
    add_column :chatrooms, :slug, :string
  end
end
