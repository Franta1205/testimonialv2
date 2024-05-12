class TestimonialsController < ApplicationController
  before_action :set_workspace, only: [:new, :create]
  skip_before_action :authenticate_user!, only: [:new, :create]

  def new
    @testimonial = Testimonial.new
  end

  def create
    @testimonial = Testimonial.new(testimonial_params)
    @testimonial.workspace = @workspace
    if @testimonial.save
      redirect_to workspace_path(@testimonial.workspace)
    else
      render :new
    end
  end

  def toggle_favorite
    @testimonial = Testimonial.find(params[:id])
    @testimonial.update(favorite: !@testimonial.favorite)
    f = @testimonial.favorite
    d = false
    redirect_to workspace_path(@testimonial.workspace)
  end

  def destroy
    @testimonial = Testimonial.find(params[:id])
    @testimonial.destroy
    redirect_to workspace_path(@testimonial.workspace)
  end

  private

  def testimonial_params
    params.require(:testimonial).permit(:content, :name, :email, :permission, :rating)
  end

  def set_workspace
    @workspace = Workspace.find(params[:workspace_id])
  end
end