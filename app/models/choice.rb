class Choice < ActiveRecord::Base
  validates_presence_of :choice1
  validates_presence_of :choice2
  belongs_to :user,
    inverse_of: :choices
  has_one :status,
    inverse_of: :choice
end
