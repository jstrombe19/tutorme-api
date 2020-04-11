class Api::V1::SubjectsController < ApplicationController
  before_action :find_subject_by_id, only: [:show, :update, :destroy]

  def index
    @subjects = Api::V1::Subject.all 

    render json: @subjects
  end

  def show
    render json: @subject 
  end

  def create
    @subject = Api::V1::Subject.new(subject_params)
    if @subject.save
      render json: @subject
    else
      render status: 422
    end
  end

  def update
    if @subject.update(subject_params)
      render json: @subject 
    else
      render status: 422
    end
  end

  def destroy 
    @subject.destroy 

    redirect_to "http://localhost:3000/api/v1/subjects"
  end

  private

  def subject_params 
    params.require(:subject).permit([:categories, :title, :description])
  end

  def find_subject_by_id
    @subject = Api::V1::Subject.find(params[:id])
  end
    
end
