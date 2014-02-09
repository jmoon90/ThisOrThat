class Status < ActiveRecord::Base
  belongs_to :choice,
    inverse_of: :status
end
