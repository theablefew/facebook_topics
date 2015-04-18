module FacebookTopics
  class Topic

    attr_accessor :result

    def initialize(result)
      @result = result
    end

    def id
      result["id"]
    end

    def name
      result["name"]
    end
  end
end
