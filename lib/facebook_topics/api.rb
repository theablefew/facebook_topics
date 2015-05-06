module FacebookTopics
  class Api
    include ::HTTParty

    base_uri "https://graph.facebook.com"

    attr_accessor :auth_token, :api_version

    def initialize(attrs)
       @auth_token = attrs.delete(:auth_token)
      @api_version = attrs.delete(:api_version)

      self.class.default_params access_token: @auth_token
    end





    def search(query, fields = [])
      q = {q: query, type: 'topic'}
      q.merge!(fields: fields.join(',')) unless fields.empty?

      TopicCollection.new self.class.get("/#{api_version}/search", {query: q})["data"]
    end





    def quick(topic, fields = [], options = {})
      topic_id = search(topic, fields).first.id
      feeds(topic_id, fields, options)
    end





    def feeds(topic_id, fields = [], options = {})
      fields = ["ranked_posts"] + fields
           q = {fields: fields.flatten.uniq.join(',')}
           q.merge! options

      FeedCollection.new self.class.get("/#{api_version}/#{topic_id}", {query: q}).parsed_response
    end




    def insights(contains_all, opts = {} )
        from_date = opts.delete(:from_date)
       until_date = opts.delete(:until_date)
           region = opts.delete(:region)
             city = opts.delete(:city)
          country = opts.delete(:country)
        continent = opts.delete(:continent)
        breakdown = opts.delete(:breakdown)

      fields = "mentions"
      fields << ".since(#{from_date})" unless from_date.nil?
      fields << ".until(#{until_date})" unless until_date.nil?
      fields << ".region(#{region})" if region.present?
      fields << ".city(#{city})" if city.present?
      fields << ".country(#{country})" if country.present?
      fields << ".continent(#{continent})" if continent.present?
      fields << ".breakdown_by(#{breakdown.reject(&:blank?)})" if breakdown.present?

      q = {contains_all: [contains_all], fields: fields}

      data = Insight.new self.class.get("/#{api_version}/topic_insights", {query: q}).parsed_response
      data.breakdown.each { |d| d["date"] = {from_date: from_date, until_date: until_date}.stringify_keys }
      return data
    end







    def api_version
      @api_version || "v2.3"
    end

  end
end
