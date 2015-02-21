require 'lannister/version'

require 'lannister/entities/trade'
require 'lannister/use_cases'
require 'lannister_data/engine'

require 'caze'

module Lannister
  include Caze

  #has_use_case :get_balance, UseCases::GetBalance
  #has_use_case :transfer_money, UseCases::GetBalance, transactional: true

  class << self
    delegate :get_balance, to: UseCases::GetBalance
    delegate :print_money, to: UseCases::PrintMoney
    delegate :transfer_money, to: UseCases::TransferMoney

    #def transfer_money(source_account_id:, destination_account_id:, amount:)
      ##transaction_handler.transaction do
        #UseCases::TransferMoney.transfer_money(source_account_id: source_account_id,
                                               #destination_account_id: destination_account_id,
                                               #amount: amount)
      ##end
    #end

    def configure
      yield self
    end

    attr_writer :trade_repo
    attr_accessor :transaction_handler

    def trade_repo
      @trade_repo ||= LannisterData::TradeRepo
    end
  end
end
