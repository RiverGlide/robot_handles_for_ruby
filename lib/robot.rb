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
    @things_we_know.each { |key, value| fill_in key, with: value }
    click_button "Submit"
  end
end
