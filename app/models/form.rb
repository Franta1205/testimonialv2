class Form < ApplicationRecord
  belongs_to :workspace

  serialize :questions, Array
end
