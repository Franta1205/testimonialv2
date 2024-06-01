# frozen_string_literal: true

class FormSideComponent < ViewComponent::Base
  def initialize(forms:, workspace:)
    @forms = forms
    @workspace = workspace
  end

  def show_header?
    @forms.any?
  end
end
