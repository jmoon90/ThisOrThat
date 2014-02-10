class ChoicesController < ApplicationController
  before_filter :authenticate_user!, except: [:show]
  def show
    @choices = []
    approved_choices = Choice.joins(:status)
    approved_choices.each do |choice|
      @choices << choice if choice.status.approved
    end
    @choice = @choices.shuffle.pop
  end

  def new
    @choice = Choice.new
  end

  def create
    @choice = Choice.new(choices_params)
    if @choice.save
      Status.find_or_create_by_choice_id(@choice.id)
      flash[:notice] = "You're choice is under view. Thanks for submitting"
      redirect_to new_choice_path
    else
      flash[:notice] = "Invalid input. Please try again"
      render :new
    end
  end

  private

  def choices_params
    params.require(:choice).permit(:choice1, :choice2)
  end
end
