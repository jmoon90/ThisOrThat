require 'spec_helper'

feature 'User' do
  given(:user) { FactoryGirl.create(:user) }
  scenario 'is an admin' do
    status = FactoryGirl.create(:status)
    status2 = FactoryGirl.create(:status, approved: true, pending: false)

    option = FactoryGirl.create(:option, question_id: status.question_id)
    option2 = FactoryGirl.create(:option, description: "Soap",
question_id: status.question_id)

    user.update_attributes(admin: true)
    login_as(user, scope: :user)
    visit statuses_path

    expect(page).to have_content(status.question.options.first.description)
    expect(page).to_not have_content(status2.question.options)
  end
end
