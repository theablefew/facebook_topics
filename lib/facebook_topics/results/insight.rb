module FacebookTopics
  class Insights
    attr_accessor :volume, :breakdown

    def initialize(results = [])
      @volume = results["data"].first["mentions"]["data"].shift["count"].to_i
      @breakdown = results["data"].first["mentions"]["data"]
    end


  end
end
