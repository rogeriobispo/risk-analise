require_relative '../../spec_helper'

RSpec.describe StartValidations do
  subject(:end_validation) { described_class.execute(transaction) }

  context 'when transaction is approved' do
    let(:transaction) { create(:transaction) }
    it do 
      expect(end_validation).to eq('APPROVE')
    end
  end


  context 'when transaction is denied' do
    let(:transaction) { create(:transaction, has_cbk: true) }

    it do 
      expect(end_validation).to eq('DENY') 
    end
  end
end
