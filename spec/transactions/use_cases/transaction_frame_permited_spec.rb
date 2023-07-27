require_relative '../../spec_helper'

RSpec.describe TransactionFramePerminted do
  subject(:transaction_frame_permited) { described_class.execute(card_number, user_id) }
  let(:transaction) { create(:transaction) }
  let(:user_id) { transaction.user_id }
  let(:card_number) { transaction.card_number }

  context 'when limit is overcame' do
    let!(:transaction) do
      create(:transaction,
             transaction_amount: 500)

      create(:transaction,
             transaction_amount: 501)
    end

    it { expect(transaction_frame_permited).to be_falsey }
  end

  context 'when transaction is under the limit' do
    it { expect(transaction_frame_permited).to be_truthy }
  end

  context 'call end service' do
    it do
      allow(UserHasChargeBack).to receive(:execute)
      expect(UserHasChargeBack).to receive(:execute)

      described_class.execute(card_number, user_id)
    end
  end
end
