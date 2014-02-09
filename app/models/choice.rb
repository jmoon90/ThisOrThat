class Choice < ActiveRecord::Base
  validates_presence_of :choice1
  validates_presence_of :choice2

  has_one :status,
    inverse_of: :choice
end
