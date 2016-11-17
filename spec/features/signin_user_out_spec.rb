require 'rails_helper'

RSpec.feature "Users signin out" do
  before do
    @user = User.create!(email: "user@example.com", password: "password", first_name: "john", last_name: "doe")

    visit "/"

    click_link "Sign in"
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log in"
  end

  scenario "sining out sucessfully" do
    visit "/"

    click_link "Sign out"

    expect(page).to have_content("Signed out successfully.")
  end
end