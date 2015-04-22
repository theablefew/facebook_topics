require 'forwardable'

module FacebookTopics
  class Collection
    extend Forwardable

    def_delegators :@results, :<<, :length, :first, :last, :collect, :to_a, :each, :reject, :select, :count, :[], :empty?

    def initialize(results = [])
      raise ApiError.new(results["error"]) if results.has_key? "error"
    end

  end
end
