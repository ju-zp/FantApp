class AddRaceColumnToChatroom < ActiveRecord::Migration[5.2]
  def change
    add_column :chatrooms, :race_id, :integer
  end
end
