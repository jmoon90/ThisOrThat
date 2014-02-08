class Choice < ActiveRecord::Base
  validates_presence_of :choice1
  validates_presence_of :choice2
end
