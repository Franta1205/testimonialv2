class Workspace < ApplicationRecord
  belongs_to :user

  def parsed_title
    title.split.map { |word| word[0].upcase }.join
  end
end
