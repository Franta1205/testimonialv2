class RenamePermissionToAgreeToTermsInTestimonials < ActiveRecord::Migration[7.0]
  def change
    rename_column :testimonials, :permission, :agree_to_terms
  end
end
