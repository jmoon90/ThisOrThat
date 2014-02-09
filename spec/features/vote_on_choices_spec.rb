require 'spec_helper'

feature 'User' do
  scenario 'views choices' do
    status = FactoryGirl.create(:status)
    status.update_attributes(approved: true, pending: false)
    visit choices_path

    expect(page).to have_content(status.choice.choice1)
  end

  scenario 'votes between choices' do
    pending
  end
end
