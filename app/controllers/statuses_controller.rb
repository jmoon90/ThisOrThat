class StatusesController < ApplicationController
  before_filter :authenticate_user!
  before_filter do
    flash[:notice] = "Must be an admin"
    redirect_to choices_path unless current_user.admin?
  end

  def index
    @choices = Choice
  end
end
