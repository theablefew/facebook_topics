require 'forwardable'

module FacebookTopics
  class Collection
    extend Forwardable

    def_delegators :@results, :<<, :length, :first, :last, :collect, :to_a, :each, :reject, :select, :count, :[], :empty?, :each_with_index

    def initialize(results = {})
      unless results.nil?
        raise ApiError.new(results["error"]) if results.has_key? "error"
      end
    end

  end
end
