require 'spec_helper'

feature 'Admin' do
  let(:user) { FactoryGirl.create(:user, admin: true) }
  let(:status) { FactoryGirl.create(:status) }
  let(:options) { FactoryGirl.create(:status) }
  before(:each) do
    login_as(user, scope: :user)
    status
    FactoryGirl.create(:option, question_id: status.question_id)
    visit statuses_path
  end

  scenario 'approves choice' do
    click_on 'Approve'

    expect(page).to_not have_content(status.question.options.first.description)
    expect(page).to have_content("Question accepted")
  end

  scenario 'disapproves choice' do
    click_on 'Decline'

    expect(page).to_not have_content(status.question.options.first.description)
    expect(page).to have_content("Question declined")
  end
end
