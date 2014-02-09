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
    choice2 = FactoryGirl.create(:choice, choice1: 'banana', choice2: 'apple')
    choice2.status.update_attributes(approved: true, pending: false)

    user.update_attributes(admin: true)
    login_as(user, scope: :user)
    visit statuses_path

    expect(page).to have_content(choice.choice1)
    expect(page).to_not have_content(choice2.choice1)
  end
end
