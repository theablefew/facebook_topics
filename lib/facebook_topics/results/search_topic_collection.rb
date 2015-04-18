require 'forwardable'

module FacebookTopics
  class SearchTopicCollection
    extend Forwardable

    def_delegators :@results, :<<, :length, :first, :last, :collect, :to_a, :each, :reject, :select, :count, :[]

    def initialize(results = [])
      @results = results.collect { |r| FacebookTopics::Topic.new r }
    end

  end
end
