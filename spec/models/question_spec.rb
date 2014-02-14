require 'spec_helper'

describe Question do
  it { should have_many(:options) }
  it { should belong_to(:user) }
  it { should have_one(:status) }
end

