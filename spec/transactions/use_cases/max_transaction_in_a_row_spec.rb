require_relative '../../spec_helper'

RSpec.describe MaxTransactionInARow do
  subject(:max_transaction_in_a_row) { described_class.execute(card_number, user_id) }

  context 'when limit is overcame' do
    let(:transaction) { transactions.last } 
    let!(:transactions) do 
      create_list(:transaction, 20)
    end
    
    let(:user_id) { transaction.user_id } 
    let(:card_number) { transaction.card_number } 


    it { expect(max_transaction_in_a_row).to be_falsey }
  end

  context 'when transaction is under the limit' do
    let!(:transaction) do 
      create(:transaction)
    end
    
    let(:user_id) { transaction.user_id } 
    let(:card_number) { transaction.card_number } 

    it { expect(max_transaction_in_a_row).to be_truthy }
  end 
  
  
  context 'call end service' do
    let(:transaction) { transactions.last } 
    let!(:transactions) do 
      create_list(:transaction, 20)
    end
    
    let(:user_id) { transaction.user_id } 
    let(:card_number) { transaction.card_number } 
    it do 
      allow(MaxTransactionInARow).to receive(:execute) 
      expect(MaxTransactionInARow).to receive(:execute)

      described_class.execute(card_number, user_id)
    end
  end
end
