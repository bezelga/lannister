require 'spec_helper'

module Lannister
  describe UseCases::PrintMoney do
    describe '.print_money' do
      subject(:print_money) do
        described_class.print_money(account_id: account_id,
                                    amount: amount)
      end

      let(:amount)     { 1_000 }
      let(:account_id) { 1 }

      it 'adds money the the account' do
        expect { print_money }.to change { Lannister.get_balance(account_id: account_id) }.by(amount)
      end
    end
  end
end
