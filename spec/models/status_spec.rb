require 'spec_helper'

describe Status do
  it { should belong_to(:question).dependent(:destroy) }
end
