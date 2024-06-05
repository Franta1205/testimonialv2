class TestimonialsController < ApplicationController
  before_action :set_workspace, only: [:new, :create, :wall_of_love]

  def new
    @testimonial = Testimonial.new
  end

  def wall_of_love
    @testimonials = @workspace.testimonials.where(favorite: true)
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
    redirect_to workspace_path(@testimonial.workspace)
  end

  def destroy
    @testimonial = Testimonial.find(params[:id])
    @testimonial.destroy
    redirect_to workspace_path(@testimonial.workspace)
  end

  private

  def testimonial_params
    params.require(:testimonial).permit(:content, :name, :email, :agree_to_terms, :rating)
  end

  def set_workspace
    @workspace = Workspace.find(params[:workspace_id])
  end
end