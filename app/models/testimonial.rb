class Testimonial < ApplicationRecord
  belongs_to :workspace

  validates :rating, numericality: { only_integer: true, grater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  def create_date
    created_at.strftime('%d/%m/%Y')
  end
end
