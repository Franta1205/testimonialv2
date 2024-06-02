class FormsController < ApplicationController
  before_action :set_workspace, only: [:new, :create, :show, :new_testimonial, :create_testimonial]
  skip_before_action :authenticate_user!, only: [:show, :create_testimonial, :new_testimonial]
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

  def new_testimonial
    @form = Form.find(params[:id])
    @testimonial = Testimonial.new
  end

  def create_testimonial
    @testimonial = Testimonial.new(testimonial_params)
    @testimonial.workspace = @workspace
    if @testimonial.save
      redirect_to action: :testimonial_success_page
    else
      flash[:error] = @testimonial.errors.full_messages.join(', ')
      redirect_to action: :new_testimonial
    end
  end

  def testimonial_success_page

  end

  def destroy
    @form = Form.find(params[:id])
    @form.destroy
    redirect_to action: :new
  end

  private

  def form_params
    params.require(:form).permit(:title, :custom_message).tap do |permitted_params|
      permitted_params[:questions] = params[:form][:questions].values
    end
  end

  def testimonial_params
    params.require(:testimonial).permit(:name, :email, :content, :agree_to_terms, :rating)
  end

  def set_workspace
    @workspace = Workspace.find(params[:workspace_id])
  end
end