class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :user
      t.references :room
      t.text :message

      t.timestamps
    end
  end
end
