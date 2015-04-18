module FacebookTopics
  class SearchTopicResult
     attr_reader :id, :name, :page

     def initialize(id, name, page)
         @id = id
       @name = name
       @page = page
     end
  end
end
