module FacebookTopics
  class Api
    include HTTParty

    base_uri "https://graph.facebook.com"

    attr_accessor :auth_token, :api_version

    def initialize(attrs)
      @auth_token = attrs.delete(:auth_token)
      @api_version = attrs.delete(:api_version)

      self.class.default_params access_token: @auth_token
    end


    def search(query, fields = nil)
      q = {q: query, type: 'topic'}
      q.merge!(fields: fields.join(',')) unless fields.nil?

      SearchTopicCollection.new self.class.get("/#{api_version}/search", {query: q})["data"]
    end

    def quick(topic, fields = nil)
      topic_id = search(topic, fields).first.id
      feeds(topic_id, fields)
    end

    def feeds(topic_id, fields = nil)
      fields = ["ranked_posts"]
      q = fields.nil? ? {} : {fields: fields.uniq.join(',')}

      TopicCollection.new self.class.get("/#{api_version}/#{topic_id}", {query: q}).parsed_response
    end

    def api_version
      @api_version || "v2.3"
    end

  end
end
