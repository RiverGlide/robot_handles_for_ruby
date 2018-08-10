class Robot
  class Question
    def initialize(question)
      @question = question
    end

    def type
      @question["data-question-type"]
    end

    def name
      @question["data-question"]
    end

    def find(something)
      @question.find(something)
    end
  end
end
