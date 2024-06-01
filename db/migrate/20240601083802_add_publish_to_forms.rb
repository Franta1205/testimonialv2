class AddPublishToForms < ActiveRecord::Migration[7.0]
  def change
    add_column :forms, :published, :boolean, default: false

    Form.update_all(published: true)
  end
end
