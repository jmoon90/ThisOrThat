require 'spec_helper'

describe Choice do
  it { should validate_presence_of(:choice1) }
  it { should validate_presence_of(:choice2) }

  it { should have_one(:status) }
end

