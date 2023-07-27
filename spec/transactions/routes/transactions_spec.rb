require_relative '../../spec_helper'

RSpec.describe 'Transactions end point', type: :request do
  subject(:response) { post '/transactions', payload }
  let(:payload) do
    attributes_for(:transaction)
  end

  let(:expected_response) do
    {
      'transaction_id' => payload[:transaction_id],
      'recommendation' => 'APPROVE'
    }
  end

  it 'expect to return the proper payload' do
    expect(JSON.parse(response.body)).to eq(expected_response)
    expect(response.status).to eq(200)
  end

  context 'when has error return errors message' do
    let(:payload) { {} }

    it 'expect to return the proper payload' do
      expect(JSON.parse(response.body)['errors']['card_number']).to eq(["can't be blank"])
      expect(response.status).to eq(422)
    end
  end

  context 'when denied' do
    let!(:transaction) { create(:transaction, has_cbk: true) }

    let(:expected_response) do
      {
        'transaction_id' => payload[:transaction_id],
        'recommendation' => 'DENY'
      }
    end

    it 'expect to return the proper payload' do
      expect(JSON.parse(response.body)).to eq(expected_response)
      expect(response.status).to eq(200)
    end
  end
end
