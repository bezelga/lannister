module Lannister
  module UseCases
    class GetBalance
      def self.get_balance(account_id:)
        Lannister.trade_repo.balance(account_id: account_id)
      end
    end
  end
end
