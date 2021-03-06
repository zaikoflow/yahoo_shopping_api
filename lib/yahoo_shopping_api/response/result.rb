module YahooShoppingApi
  module Response
    class Result
      def initialize(json)
        json.each do |key, value|
          self.define_singleton_method(key.underscore) {value[0]}
        end
      end
    end
  end
end
