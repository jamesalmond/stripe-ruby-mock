module StripeMock
  module RequestHandlers
    module Refunds

      def Refunds.included(klass)
        klass.add_handler 'post /v1/refunds', :refund_charge
      end

      def refund_charge(route, method_url, params, headers)
        refund = Data.mock_refund params.merge(
          :balance_transaction => new_balance_transaction('txn'),
          :id => new_id('re')
        )
        refund
      end

    end
  end
end
