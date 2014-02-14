require 'spec_helper'

feature 'user' do
  let(:user) { FactoryGirl.create(:user) }

  before(:each) do
    login_as(user, scope: :user)
  end

  scenario 'creates options with valid input' do
pending
    visit new_question_path

    fill_in 'Description', with: "Better soda?"
    fill_in 'Option 1', with: "Pepsi"
    fill_in 'Option 2', with: "Coke"
    click_on 'Submit'

    expect(page).to have_content("You're choice is under view. Thanks for submitting")
  end

  scenario 'creates choices with invalid input' do
    visit new_question_path
    click_on 'Submit'
    expect(page).to have_content("Invalid input. Please try again")
  end
end
