class AddFieldsToWorkspaces < ActiveRecord::Migration[7.0]
  def change
    add_column :workspaces, :header_title, :string
    add_column :workspaces, :custom_message, :string
    add_column :workspaces, :collection_type, :integer, default: 2
    change_column_null :workspaces, :title, false
  end
end
