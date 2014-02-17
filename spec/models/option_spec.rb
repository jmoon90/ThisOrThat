require 'spec_helper'

describe Option do
  it { should validate_presence_of :description }
  it { should belong_to(:question) }
  it { should have_many(:votes) }
end
