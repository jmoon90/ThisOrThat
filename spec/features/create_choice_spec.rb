require 'spec_helper'

feature 'user' do
  before(:each) do 
    FactoryGirl.create(:user)
  end
  scenario 'creates choices with valid input' do
    visit new_choice_path
    fill_in 'Choice1', with: "Pepsi"
    fill_in 'Choice2', with: "Coke"
    click_on 'Submit'
    
    expect(page).to have_content("You're choice is under view. Thanks for submitting")
  end

  scenario 'creates choices with invalid input' do
    visit new_choice_path
    click_on 'Submit'
    expect(page).to have_content("Invalid input. Please try again")
  end
end
