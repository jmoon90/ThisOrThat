class StatusesController < ApplicationController
  before_filter :authenticate_user!
  before_filter do
    redirect_to choices_path unless current_user.admin?
  end

  def index
    choices = Status.where(pending: true).pluck(:choice_id)
    @choices =[]
    choices.each do |x|
      @choices << Choice.find(x)
    end
  end

  def update
    Choice.find(params[:id]).status.update_attributes(pending: false, approved: true)
    flash[:notice] = "Choice accepted"
    redirect_to statuses_path
  end

  def destroy
    Choice.find(params[:id]).status.update_attributes(pending: false)
    flash[:notice] = "Choice delinced"
    redirect_to statuses_path
  end
end
