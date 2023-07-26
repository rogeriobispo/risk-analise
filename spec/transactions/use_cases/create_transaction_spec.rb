require_relative '../../spec_helper'

RSpec.describe CreateTransaction do
  subject(:transaction) { described_class.execute(payload) }
  
  context 'return a valid transaction' do
    let(:payload) { attributes_for(:transaction) }
    it { expect(transaction).to be_valid }
  end

  context 'return a invalid transaction' do
    let(:payload) { { transaction_id: 123 } }
    it { expect(transaction).to be_invalid }
  end
end
