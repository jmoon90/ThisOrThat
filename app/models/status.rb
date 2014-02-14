class Status < ActiveRecord::Base
  belongs_to :question,
    inverse_of: :status,
    dependent: :destroy
end
