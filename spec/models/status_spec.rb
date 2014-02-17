require 'spec_helper'

describe Status do
  it { should belong_to(:question) }
end
