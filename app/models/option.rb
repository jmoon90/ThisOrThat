class Option < ActiveRecord::Base
  belongs_to :question,
    inverse_of: :options,
    dependent: :destroy
  has_many :votes,
    inverse_of: :option

  validates_presence_of :description
end
