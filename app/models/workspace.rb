class Workspace < ApplicationRecord
  belongs_to :user
  has_many :testimonials
  has_many :forms

  validates :title, presence: true

  enum collection_type: { text: 0, video: 1, both: 2}

  def parsed_title
    title.split.map { |word| word[0].upcase }.join
  end
end
