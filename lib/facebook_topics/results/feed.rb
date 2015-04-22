module FacebookTopics
  class Feed < Hash
    include Hashie::Extensions::MethodAccess

    def initialize(feed = {})
      super
      feed.each_pair do |k,v|
        self[k] = v
      end
    end

    def comments
      self["comments"]["data"]
    end

  end
end
