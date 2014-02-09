require 'spec_helper'

feature 'Admin' do
  let(:user) { FactoryGirl.create(:user, admin: true) }
  let(:status) {  FactoryGirl.create(:status) }
  before(:each) do
    login_as(user, scope: :user)
      status
    visit statuses_path
  end

  scenario 'approves choice' do
    click_on 'Approve'
    expect(page).to_not have_content(status.choice.choice1)
    expect(page).to have_content("Choice accepted")
  end

  scenario 'disapproves choice' do
    click_on 'Decline'
    expect(page).to_not have_content(status.choice.choice1)
    expect(page).to have_content("Choice delinced")
  end
end
