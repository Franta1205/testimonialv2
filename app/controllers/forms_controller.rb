class FormsController < ApplicationController
  before_action :set_workspace, only: [:new, :create]
  skip_before_action :authenticate_user!, only: [:show]
  def new
    @form = Form.new
  end

  def create
    @form = @workspace.forms.new(form_params)
    if @form.save
      redirect_to action: :new
    else
      redirect_to action: :new
    end
  end

  def update
    @form = Form.find(params[:id])
    @form.update(published: !@form.published)
    redirect_to action: :new
  end

  def show
    @form = Form.find(params[:id])
  end

  def destroy
    @form = @workspace.forms.find(params[:id])
    @form.destroy
    redirect_to action: :new
  end

  private

  def form_params
    params.require(:form).permit(:title, :custom_message).tap do |permitted_params|
      permitted_params[:questions] = params[:form][:questions].values
    end
  end

  def set_workspace
    @workspace = Workspace.find(params[:workspace_id])
  end
end