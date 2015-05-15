class RenameTableProjectcommentsToComments < ActiveRecord::Migration
  def change
    rename_table :project_comments, :comments

  end
end
