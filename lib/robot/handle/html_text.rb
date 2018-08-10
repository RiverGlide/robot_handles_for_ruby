class Robot
  class Handle
    class HtmlText
      def initialize(question)
        @question = question
      end

      def gives(answer)
        Capybara.current_session.fill_in @question.find("input")["name"], with: answer unless answer.nil?
      end
    end
  end
end
