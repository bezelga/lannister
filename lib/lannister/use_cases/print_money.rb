require 'caze'

module Lannister
  module UseCases
    class PrintMoney
      include Caze

      export :print, as: :print_money

      delegate :trade_repo, to: Lannister

      def initialize(account_id:, amount:)
        @account_id = account_id
        @amount = amount
      end

      def print
        trade_repo.persist Entities::Trade.new(account_id: account_id, amount: amount, date: Date.today)
      end

      private

      attr_reader :account_id, :amount
    end
  end
end
