require 'spec_helper'

feature 'User' do
  given(:user) { FactoryGirl.create(:user) }
  scenario 'is an admin' do
    status = FactoryGirl.create(:status)
    status2 = FactoryGirl.create(:status, approved: true, pending: false)

    user.update_attributes(admin: true)
    login_as(user, scope: :user)
    visit statuses_path

    expect(page).to have_content(status.choice.choice1)
    expect(page).to_not have_content(status2.choice.choice1)
  end
end
