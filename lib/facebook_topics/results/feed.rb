module FacebookTopics
  class Feed
    include Hashie::Extensions::MethodAccess

    def initialize(feed)
      @feed = feed
    end
  end
end
