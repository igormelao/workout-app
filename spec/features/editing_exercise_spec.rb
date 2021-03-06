require 'rails_helper'

RSpec.feature "Editing Exercises" do
  before do
    @owner = User.create(email: "owner@example.com", password: "password", first_name: "john", last_name: "doe")

    @owner_exerc = @owner.exercises.create!(duration_in_min: 45, workout: "Cardio Acitivty", workout_date: Date.today)

    login_as @owner
  end

  scenario "with valid inputs succeeds" do
    visit "/"
    click_link "My Lounge"
    link = "a[href='/users/#{@owner.id}/exercises/#{@owner_exerc.id}/edit']"
    find(link).click
    fill_in "Duration", with: 50
    click_button "Update Exercise"

    expect(page).to have_content("Exercises has been updated")
    expect(page).to have_content(50)
    expect(page).not_to have_content(45)
  end
end