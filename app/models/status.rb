class Status < ActiveRecord::Base
  belongs_to :question,
    inverse_of: :status

  def self.questions
    @questions =[]
    questions_id = Status.where(pending: true).pluck(:question_id)

    questions_id.each do |id|
      @questions << Question.find(id)
    end
    @questions
  end
end
