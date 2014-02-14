class StatusesController < ApplicationController
  before_filter :authenticate_user!
  before_filter do
    redirect_to choices_path unless current_user.admin?
  end

  def index
    questions = Status.where(pending: true).pluck(:question_id)
    @questions =[]
    questions.each do |x|
      @questions << Question.find(x)
    end
  end

  def update
    Question.find(params[:id]).status.update_attributes(pending: false, approved: true)
    flash[:notice] = "Question accepted"
    redirect_to statuses_path
  end

  def destroy
    Question.find(params[:id]).status.update_attributes(pending: false)
    flash[:notice] = "Question declined"
    redirect_to statuses_path
  end

  private

  def status_params
  end
end
