require 'rails_helper'

RSpec.feature "Users signin" do
  before do
    @user = User.create!(email: "user@example.com", password: "password", first_name: "john", last_name: "doe")
  end
  scenario "with valid credentials" do 
    visit "/"

    click_link "Sign in"

    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Signed in as #{@user.email}")
  end
end