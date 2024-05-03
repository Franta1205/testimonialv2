class AddLogoToWorkspaces < ActiveRecord::Migration[7.0]
  def change
    add_column :workspaces, :logo, :string
  end
end
