class WorkspacesController < ApplicationController
  def index
    @workspaces = current_user.workspaces
  end

  def create
    @workspace = current_user.workspaces.new(workspace_params)
    if @workspace.save
      redirect_to action: :index
    else
      h = false
    end
  end

  private

  def workspace_params
    params.require(:workspace).permit(:title)
  end
end