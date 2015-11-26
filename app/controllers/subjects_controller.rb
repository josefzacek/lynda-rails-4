class SubjectsController < ApplicationController
  layout false

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new(name: 'Some default name')
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      redirect_to action: 'show', id: @subject.id
    else
      render 'new'
    end
  end

  def edit
  end

  def delete
  end
end
