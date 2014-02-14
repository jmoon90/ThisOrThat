require 'spec_helper'

describe Vote do
  it { should belong_to(:option).dependent(:destroy) }
end
