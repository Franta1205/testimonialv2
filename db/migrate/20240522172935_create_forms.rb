class CreateForms < ActiveRecord::Migration[7.0]
  def change
    create_table :forms do |t|
      t.references :workspace, null: false, foreign_key: true
      t.string :title
      t.string :custom_message
      t.string :questions
      t.integer :collection_type

      t.timestamps
    end
  end
end
