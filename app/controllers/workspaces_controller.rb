class WorkspacesController < ApplicationController
  def index
    @workspaces = current_user.workspaces
    @testimonials_count = @workspaces.map(&:testimonials).flatten.count
  end

  def create
    number = current_user.workspaces.count
    @workspace = current_user.workspaces.new(title: "Workspace ##{number + 1}")
    if @workspace.save
      flash[:success] = t('workspaces.create.success')
      redirect_to action: :index
    else
      flash[:error] = t('workspaces.create.error')
    end
  end

  def show
    @workspace = current_user.workspaces.find(params[:id])
    @testimonials = @workspace.testimonials
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