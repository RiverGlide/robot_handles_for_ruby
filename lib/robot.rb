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
      send(question["data-question-type"].gsub('-','_'), question)
    end
    click_button "Submit"
  end

  def html_text(question)
    fill_in question.find("input")["name"], with: @things_we_know[question["data-question"]] if @things_we_know.has_key?(question["data-question"])
  end

  def html_select(question)
    select @things_we_know[question["data-question"]], from: question.find("select")["name"] if @things_we_know.has_key?(question["data-question"])
  end
end
