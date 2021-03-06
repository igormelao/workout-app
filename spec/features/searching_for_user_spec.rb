require  'rails_helper'

RSpec.feature "Searching for User" do
  before do
    @john = User.create(email: "john@example.com", password: "password", first_name: "John", last_name: "Doe")
    @sarah = User.create(email: "sarah@example.com", password: "password", first_name: "Sarah", last_name: "Doe")
  end

  scenario "with existing name returns all those users" do
    visit "/"
    fill_in "search_name", with: "Doe"
    click_button "Search"

    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@sarah.full_name)
    expect(current_path).to eq("/dashboard/search")
  end
end