require 'spec_helper'

module Lannister
  describe UseCases::TransferMoney do
    describe '.transfer' do
      subject(:transfer) do
        described_class.transfer_money(source_account_id: source_account_id,
                                       destination_account_id: destination_account_id,
                                       amount: amount )
      end

      let(:amount)                 { 1_000 }
      let(:source_account_id)      { 1 }
      let(:destination_account_id) { 2 }

      def get_balance(account_id)
        Lannister.get_balance(account_id: account_id)
      end

      def source_account_balance
        get_balance(source_account_id)
      end

      def destination_account_balance
        get_balance(destination_account_id)
      end

      context 'enough money to transfer' do
        before do
          Entities::Factory.fabricate_trade(account_id: source_account_id,
                                            amount: amount)
        end

        it 'debits the source account' do
          expect{ transfer }.to change{ source_account_balance }.by(- amount)
        end

        it 'credits the destination account' do
          expect{ transfer }.to change{ destination_account_balance }.by(amount)
        end
      end

      context 'not enough money to transfer' do
        it 'cancels the transfer and responds false' do
          expect(transfer).to eq(false)
        end

        it 'does not change the accounts balance' do
          expect{ transfer }.to_not change{ source_account_balance }
          expect{ transfer }.to_not change{ destination_account_balance }
        end
      end
    end
  end
end
