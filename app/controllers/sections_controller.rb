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
    @pages = Page.order('position ASC')
  end

  def create
    @section = Section.create(section_params)
    if @section.save
      flash[:notice] = "#{@section.name} successfully created"
      redirect_to action: 'show', id: @section.id
    else
      @pages = Page.order('position ASC')
      render 'new'
    end
  end

  def edit
    @section = Section.find(params[:id])
    @pages = Page.order('position ASC')
    @section_count = Section.count
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "#{@section.name} successfully updated"
      redirect_to action: 'show', id: @section.id
    else
      @pages = Page.order('position ASC')
      @section_count = Section.count
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
