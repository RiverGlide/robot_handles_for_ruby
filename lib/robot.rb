require "capybara"
require "capybara/dsl"
require "robot/question"

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
    questions_on(page).each do |question|
      send(handler_for(question.type), question)
    end
    click_button "Submit"
  end

  def questions_on(page)
    page.find_all("[data-question]").map { |question| Robot::Question.new(question) }
  end

  def handler_for(type)
    type.gsub("-", "_")
  end

  def html_text(question)
    fill_in question.find("input")["name"], with: @things_we_know[question.name] if @things_we_know.has_key?(question.name)
  end

  def html_select(question)
    select @things_we_know[question.name], from: question.find("select")["name"] if @things_we_know.has_key?(question.name)
  end
end
