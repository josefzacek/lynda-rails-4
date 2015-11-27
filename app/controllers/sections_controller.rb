class SectionsController < ApplicationController
  layout 'admin'

  def index
    @sections = Section.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.create(section_params)
    if @section.save
      flash[:notice] = "#{@section.name} successfully created"
      redirect_to action: 'show', id: @section.id
    else
      render 'new'
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "#{@section.name} successfully updated"
      redirect_to action: 'show', id: @section.id
    else
      render 'edit'
    end
  end

  def delete
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = "#{@section.name} successfully deleted"
    redirect_to action: 'index'
  end

  private

  def section_params
    params.require(:section).permit(:page_id, :name, :position, :visible, :content_type, :content)
  end
end
