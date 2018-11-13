class AddPublicColumnToChatroomTable < ActiveRecord::Migration[5.2]
  def change
    add_column :chatrooms, :public, :boolean
  end
end
