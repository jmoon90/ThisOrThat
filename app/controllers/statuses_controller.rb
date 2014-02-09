class StatusesController < ApplicationController
  before_filter :authenticate_user!
  before_filter do
    flash[:notice] = "Must be an admin"
    redirect_to choices_path unless current_user.admin?
  end

  def index
    choices = Status.where(pending: true).pluck(:choice_id)
    @choices =[]
    choices.each do |x|
      @choices << Choice.find(x)
    end
  end
end
