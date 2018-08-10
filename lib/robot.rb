require "capybara"
require "capybara/dsl"

class Robot
  include Capybara::DSL

  def initialize
    @things_we_know = {}
  end

  def knows(things)
    @things_we_know.merge!(things)
  end

  def exchange_knowledge_with(app)
    visit(app)
    page.find_all("[data-question]").each do |question|
      fill_in question["data-question"], with: @things_we_know[question["data-question"]] if @things_we_know.has_key?(question["data-question"])
    end
    click_button "Submit"
  end
end
