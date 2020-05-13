class RenameTextColumnToTags < ActiveRecord::Migration[5.2]
  def change
    rename_column :tags, :text, :tagname
  end
end
