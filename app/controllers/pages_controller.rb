class PagesController < ApplicationController
  before_action :confirm_logged_in
  layout 'admin'

  def index
    @pages = Page.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new(name: 'Some default name')
    @subjects = Subject.order('position ASC')
    @page_count = Page.count + 1
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "#{@page.name} successfully created"
      redirect_to action: 'show', id: @page.id
    else
      @subjects = Subject.order('position ASC')
      @page_count = Page.count + 1
      render 'new'
    end
  end

  def edit
    @page = Page.find(params[:id])
    @subjects = Subject.order('position ASC')
    @page_count = Page.count
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "#{@page.name} successfully updated"
      redirect_to action: 'show', id: @page.id
    else
      @subjects = Subject.order('position ASC')
      @page_count = Page.count
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
