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

  def show
    @workspace = current_user.workspaces.find(params[:id])
  end

  def destroy
    @workspace = current_user.workspaces.find(params[:id])
    @workspace.destroy
    redirect_to action: :index
  end

  private

  def workspace_params
    params.require(:workspace).permit(:title, :header_title, :custom_message, :collection_type)
  end
end