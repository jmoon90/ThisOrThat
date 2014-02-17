class Question < ActiveRecord::Base
  belongs_to :user,
    inverse_of: :questions
  has_one :status,
    inverse_of: :question,
    dependent: :destroy
  has_many :options,
    inverse_of: :question,
    dependent: :destroy
  accepts_nested_attributes_for :options

  def self.approved_questions
    @questions = []
    approved_questions_list = Question.joins(:status)
    approved_questions_list.each do |question|
      @questions << question if question.status.approved
    end
    @questions.shuffle.pop
  end
end
