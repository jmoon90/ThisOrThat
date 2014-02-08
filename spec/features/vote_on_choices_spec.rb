require 'spec_helper'

feature 'User' do
  scenario 'views choices' do
    choice = FactoryGirl.create(:choice)
    visit choices_path

    expect(page).to have_content(choice.choice1)
    expect(page).to have_content(choice.choice2)
  end

  scenario 'votes between choices' do
    pending
  end
end
