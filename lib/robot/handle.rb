require "require_all"
require_rel "handle"

class Robot
  class Handle
    def self.for(question)
      const_get(question.type.split("-").map(&:capitalize).join("")).new(question)
    end
  end
end
