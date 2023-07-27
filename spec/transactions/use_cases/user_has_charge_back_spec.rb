require_relative '../../spec_helper'

RSpec.describe UserHasChargeBack do
  subject(:user_has_charge_back) { described_class.execute(user_id) }
  let(:transaction) { create(:transaction) } 
  let(:user_id) { transaction.user_id } 

  context 'when has chargeback' do
    let!(:has_cbk) { create(:transaction, has_cbk: true) }

    it { expect(user_has_charge_back).to be_falsey }
  end

  context 'when does note have chargeback' do
    it { expect(user_has_charge_back).to be_truthy}
  end

  context 'call end service' do
    it do 
      allow(EndValidations).to receive(:execute) 
      expect(EndValidations).to receive(:execute)

      described_class.execute(user_id)
    end
  end
end
