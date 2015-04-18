require 'forwardable'

module FacebookTopics
  class TopicCollection
    extend Forwardable

    def_delegators :@results, :<<, :length, :first, :last, :collect, :to_a, :each, :reject, :select, :count, :[], :second

    def initialize(results = [])
      raise ApiError.new(results["error"]) if results.has_key? "error"
      results = results["ranked_posts"]["data"] || []
      @results = results.collect { |r| FacebookTopics::Feed.new r }
    end

  end
end
