class PagesController < ApplicationController
  layout 'admin'

  def index
    @pages = Page.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new(name: 'Some default name')
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "#{@page.name} successfully created"
      redirect_to action: 'show', id: @page.id
    else
      render 'new'
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "#{@page.name} successfully updated"
      redirect_to action: 'show', id: @page.id
    else
      render 'edit'
    end
  end

  def delete
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "#{@page.name} successfully deleted"
    redirect_to action: 'index'
  end

  private

  def page_params
    params.require(:page).permit(:subject_id, :name, :pemalink, :position, :visible)
  end
end
