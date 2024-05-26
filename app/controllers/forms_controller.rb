class FormsController < ApplicationController
  before_action :set_workspace
  def new
    @form = Form.new
  end

  def create
    f = false
  end

  private

  def set_workspace
    @workspace = Workspace.find(params[:workspace_id])
  end
end