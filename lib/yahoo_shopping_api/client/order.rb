module YahooShoppingApi
  module Client
    class Order < Helper
      def initialize(args)
        super
      end

      def count()
        Response::Order.new get_request('orderCount')
      end

      def list(args)
xml = <<-XML
<Req>
<Search>
<Result>100</Result>
<Start>1</Start>
<Sort>-order_time</Sort>
<Condition>
<OrderTimeFrom>#{args[:OrderTimeFrom]}</OrderTimeFrom>
</Condition>
<Field>OrderId</Field>
</Search>
<SellerId>#{seller_id}</SellerId>
</Req>
XML
        Response::Order.new xml_post('orderList', xml)
      end
    end
  end
end
