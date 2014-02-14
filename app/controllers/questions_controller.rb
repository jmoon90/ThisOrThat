class QuestionsController < ApplicationController
  before_filter :authenticate_user!, except: [:show]
  def show
    @questions = []
    approved_questions = Question.joins(:status)
    approved_questions.each do |question|
      @questions << question if question.status.approved
    end
    @question = @questions.shuffle.pop
    @options = @question.options
  end

  def new
    @question = Question.new
    @question.options.build
    @question.options.build
  end

  def create
    @question = Question.new(questions_params)
    if @question.save
      Status.find_or_create_by_question_id(@question.id)
      flash[:notice] = "You're question is under view. Thanks for submitting"
      redirect_to new_question_path
    else
      flash[:notice] = "Invalid input. Please try again"
      render :new
    end
  end

  private

  def questions_params
    params.require(:question).permit(:description, options_attributes:
[:id, :question_id, :description])
  end
end
