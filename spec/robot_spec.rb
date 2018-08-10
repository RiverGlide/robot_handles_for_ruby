require "rspec"
require "capybara"
require "capybara/rspec"
require "robot_example_app"
require "robot"

Capybara.app = RobotExampleApp

describe "a robot interacting with an app", type: :feature do
  it "can fill in a text box" do
    andy = Robot.new
    andy.knows("name" => "Andy")
    andy.exchange_knowledge_with("/")
    expect(page).to have_content "name-text Andy"
  end

  it "can select from a select box" do
    andy = Robot.new
    andy.knows("name" => "Andy")
    andy.exchange_knowledge_with("/")
    expect(page).to have_content "name-select Andy"
  end
end
