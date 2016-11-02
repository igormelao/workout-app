require 'rails_helper'

RSpec.feature "Creating Home Page" do
  
  scenario do
    visit "/"

    expect(response).to have_link("Athletes Den")
    expect(response).to have_link("Home")
    expect(response).to have_content("Workout Lounge")
  end
  
end