module YahooShoppingApi
  module Response
    class Parser < Array
      attr_reader :body

      def initialize(xml)
        raise ArgumentError, "Argument is must be a XML Document: #{xml}" unless xml.class == String
        @body = xml
        json = XmlSimple.xml_in(xml)

        json.each do |key, value|
          next if key == "Result"
          self.define_singleton_method(key.underscore) {value[0]}
        end

        if json["Search"]
          key = "Search"
        else
          key = "Result"
        end

        if json[key].size == 1
          json[key][0].each {|key, value| define_singleton_method(key.underscore) {value[0]}}
        else
          json[key].each {|item| self << Result.new(item)}
        end
      end
    end
  end
end
