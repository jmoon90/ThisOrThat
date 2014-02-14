class Option < ActiveRecord::Base
  belongs_to :question,
    inverse_of: :options,
    dependent: :destroy
  validates_presence_of :description
end
