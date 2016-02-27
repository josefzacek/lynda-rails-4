class SubjectsController < ApplicationController
  layout 'admin'

  def index
    @subjects = Subject.sorted
    @page_title = 'Subjects'
  end

  def show
    @subject = Subject.find(params[:id])
    @page_title = @subject.name
  end

  def new
    @subject = Subject.new(name: 'Some default name')
    @subject_count = Subject.count + 1
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      flash[:notice] = "#{@subject.name} successfully created"
      redirect_to action: 'show', id: @subject.id
    else
      @subject_count = Subject.count + 1
      render 'new'
    end
  end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(subject_params)
      flash[:notice] = "#{@subject.name} successfully updated"
      redirect_to action: 'show', id: @subject.id
    else
      @subject_count = Subject.count
      render 'edit'
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id]).destroy
    flash[:notice] = "#{@subject.name} successfully deleted"
    redirect_to action: 'index'
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end
end
