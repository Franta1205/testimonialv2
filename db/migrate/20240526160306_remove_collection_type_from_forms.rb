class RemoveCollectionTypeFromForms < ActiveRecord::Migration[7.0]
  def change
    remove_column :forms, :collection_type, :integer
  end
end
