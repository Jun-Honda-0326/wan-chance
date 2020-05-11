class RemoveUserIdFromRooms < ActiveRecord::Migration[5.2]
  def change
    remove_column :rooms, :user_id, :bigint
  end
end
