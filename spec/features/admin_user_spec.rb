require 'spec_helper'

feature 'User' do
  given(:user) { FactoryGirl.create(:user) }
  scenario 'is not an admin' do
    login_as(user, scope: :user)
    visit statuses_path

    expect(page).to have_content("Must be an admin")
  end

  scenario 'is an admin' do
    choice = FactoryGirl.create(:choice)
    user.update_attributes(admin: true)
    login_as(user, scope: :user)
    visit statuses_path

    expect(page).to have_content(choice.choice1)
    expect(page).to have_content(choice.choice2)
  end
end
