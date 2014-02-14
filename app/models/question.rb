class Question < ActiveRecord::Base
  belongs_to :user,
    inverse_of: :questions
  has_one :status,
    inverse_of: :question
  has_many :options,
    inverse_of: :question
  accepts_nested_attributes_for :options
end