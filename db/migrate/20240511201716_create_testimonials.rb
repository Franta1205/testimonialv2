class CreateTestimonials < ActiveRecord::Migration[7.0]
  def change
    create_table :testimonials do |t|
      t.references :workspace, null: false, foreign_key: true
      t.text :content
      t.text :name
      t.text :email
      t.boolean :permission
      t.integer :rating

      t.timestamps
    end
  end
end
