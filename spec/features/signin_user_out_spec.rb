require 'rails_helper'

RSpec.feature "Users signin out" do
  before do
    @user = User.create!(email: "user@example.com", password: "password")

    visit "/"

    click_link "Sign in"
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Sign in"
  end

  scenario "sining out sucessfully" do
    visit "/"

    click_link "Sign Out"

    expect(page).to have_content("Signed out successfully.")
  end
end