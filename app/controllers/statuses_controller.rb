class StatusesController < ApplicationController
  before_filter :authenticate_user!
  before_filter do
    redirect_to choices_path unless current_user.admin?
  end

  def index
    @questions = Status.questions
  end

  def update
binding.pry
    Question.find(params[:id]).status.update_attributes(pending: false, approved: true)
    flash[:notice] = "Question accepted"
    redirect_to statuses_path
  end

  def destroy
binding.pry
    Question.find(params[:id]).status.update_attributes(pending: false)
    flash[:notice] = "Question declined"
    redirect_to statuses_path
  end

  private
  def status_params
    params(:status).permit(:pending, :approved, :declined, :question_id)
  end
end
