require 'spec_helper'

describe Users::OmniauthCallbacksController, 'OmniAuth' do
  before(:each) do
    omniauth_hash =
      {:provider => "facebook",
       :uid      => "1234",
       :info   => {:first_name       => "John",
                   :last_name       => "Doe",
                   :email      => "johndoe@email.com"},
       :credentials => {:token => "testtoken234tsdf"}}
    @user_info = OmniAuth.config.add_mock(:facebook, omniauth_hash)
  end

  it "signs up with Facebook" do
    @user = User.find_for_facebook_oauth(@user_info)
    visit new_user_registration_path
    click_on 'Sign in with Facebook'
    expect(page).to have_content("John")
  end
end
