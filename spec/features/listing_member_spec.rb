require  'rails_helper'

RSpec.feature "Listing members" do
  before do
    @john = User.create(email: "john@example.com", password: "password", first_name: "John", last_name: "Doe")
    @sarah = User.create(email: "sarah@example.com", password: "password", first_name: "Sarah", last_name: "Joseph")
  end

  scenario "shows a list of registered members" do
    visit "/"
    expect(page).to have_content("List of Members")
    expect(page).to have_content("#{@john.full_name}")
    expect(page).to have_content("#{@sarah.full_name}")
  end
end