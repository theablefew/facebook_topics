module FacebookTopics
  class ApiError < RuntimeError
    attr_accessor :code, :type

    def initialize(err)

      @code = err["code"]
      @type = err["type"]
      super("#{@type} #{err['message']} - code: #{@code}")
    end
  end
end
