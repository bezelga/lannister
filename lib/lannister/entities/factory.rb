module Lannister
  module Entities
    module Factory
      def self.fabricate_trade(account_id:, amount:, date: Date.new(2015, 3, 7))
        entity = Entities::Trade.new(account_id: account_id,
                                     date: date,
                                     amount: amount)

        Lannister.trade_repo.persist(entity)
      end
    end
  end
end
