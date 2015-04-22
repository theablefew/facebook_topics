module FacebookTopics
  class TopicCollection < Collection

    def initialize(results = [])
      super(results.first)
      @results = results.collect { |r| FacebookTopics::Topic.new r }
    end

  end
end
