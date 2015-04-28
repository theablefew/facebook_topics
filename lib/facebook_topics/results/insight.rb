module FacebookTopics
  class Insight
    attr_accessor :volume, :breakdown

    def initialize(results = {})
      raise RuntimeError.new results["error"]["message"] if results.has_key? "error"
      @volume = results["data"].first["mentions"]["data"].shift["count"].to_i rescue 0
      @breakdown = results["data"].first["mentions"]["data"] rescue []
    end


  end
end
