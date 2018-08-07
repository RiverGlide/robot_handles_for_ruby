require "rspec"
require "capybara"
require "capybara/rspec"
require "robot_example_app"

Capybara.app = RobotExampleApp

describe "something", type: :feature do
  it "does something" do
    visit("/")
    fill_in "name", with: "Andy"
    click_button "Submit"
    expect(page).to have_content "name Andy"
  end
end
