require 'spec_helper'

feature 'User' do
  scenario 'views choices' do
    status = FactoryGirl.create(:status)
    status.update_attributes(approved: true, pending: false)
    FactoryGirl.create(:option, question_id: status.question.id)
    visit root_path

    expect(page).to have_content(status.question.description)
  end

  scenario 'votes between choices' do
pending "vote not implemented yet"
    status = FactoryGirl.create(:status)
    status.update_attributes(approved: true, pending: false)
    visit root_path

    click_on status.choice.choice1
    expect(page).to have_content('1 agree')
  end
end
