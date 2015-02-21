# Transfer Money - use case
#
# Data:
# <source_account_id>, <destination_account_id>, <amount>
#
# Primary course:
#
#  1. Client triggers “Transfer Money” with above data.
#  2. System validates all data.
#  3. System creates a debit on the source account.
#  4. System creates a credit on the destination account.
#
# Exception Course: Not enough money on the source account.
#
#  1. System cancels the transfer.
#

require 'caze'
require 'forwardable'

module Lannister
  module UseCases
    class TransferMoney
      include Caze

      export :transfer, as: :transfer_money

      delegate :get_balance, :trade_repo, to: Lannister

      def initialize(source_account_id:, destination_account_id:, amount:)
        @source_account_id = source_account_id
        @destination_account_id = destination_account_id
        @amount = amount
      end

      def transfer
        return false if get_balance(account_id: source_account_id) < amount

        trade_repo.persist Entities::Trade.new(account_id: source_account_id, amount: - amount)
        trade_repo.persist Entities::Trade.new(account_id: destination_account_id, amount: amount)
      end

      private

      attr_reader :source_account_id, :destination_account_id, :amount
    end
  end
end
