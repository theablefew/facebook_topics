module FacebookTopics
  class FeedCollection < Collection
    attr_accessor :paging, :id

    def initialize(results = [])
      super(results)

           @id = results["id"]
       @paging = results["paging"] || results["ranked_posts"]["paging"]
      @results = (results["data"] || results["ranked_posts"]["data"] || []).collect { |r| FacebookTopics::Feed.new r }
    end




    def next
      next_url = URI.encode paging["next"]
      FeedCollection.new HTTParty.get(URI.parse(next_url)).parsed_response
    end





    def previous
      previous_url = URI.encode paging["previous"]
      FeedCollection.new HTTParty.get(URI.parse(previous_url)).parsed_response
    end





    def id
      @id
    end


  end
end
