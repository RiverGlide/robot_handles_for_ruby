require "capybara"
require "capybara/dsl"
require "robot/handle"
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
      Robot::Handle.for(question).gives(answer_for(question))
    end
    click_button "Submit"
  end

  def questions_on(page)
    page.find_all("[data-question]").map { |question| Robot::Question.new(question) }
  end

  def answer_for(question)
    @things_we_know[question.name]
  end
end
