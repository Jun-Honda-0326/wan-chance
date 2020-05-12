class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.text :text
      t.timestamps
    end
  end
end
