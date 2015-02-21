module Lannister
  module Entities
    class Trade
      attr_accessor :id, :account_id, :amount, :date

      def initialize(attributes = {})
        @id, @account_id, @amount, @date = attributes.values_at(:id, :account_id, :amount, :date)
      end
    end
  end
end

require 'active_model'

module Lannister
  module Entities
    class Trade
      include ActiveModel::Model

      attr_accessor :id, :account_id, :amount, :date

      validates_presence_of :account_id, :amount, :date

      validates :amount, numericality: { greater_than: 0 }
    end
  end
end
