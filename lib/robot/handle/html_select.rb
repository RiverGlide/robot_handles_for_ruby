class Robot
  class Handle
    class HtmlSelect
      def initialize(question)
        @question = question
      end

      def gives(answer)
        Capybara.current_session.select answer, from: @question.find("select")["name"] unless answer.nil?
      end
    end
  end
end
