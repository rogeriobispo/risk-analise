require_relative '../../spec_helper'

RSpec.describe 'Transactions end point', type: :request do
  subject(:response) { post '/transactions', payload }
  let(:payload) do
    attributes_for(:transaction)
  end

  let(:expected_response) do 
    { 
      'transaction_id' => payload[:transaction_id],
      'recommendation' => 'approve'

    } 
  end

  it 'expect to return the proper payload' do
    expect(JSON.parse(response.body)).to eq(expected_response)
    expect(response.status).to eq(200)
  end


  context 'when has error return errors message' do
    let(:payload) { {} }
    let(:expected_response) do
       {
          "errors"=>{
            "card_number"=>["can't be blank"], 
            "merchant_id"=>["can't be blank"], 
            "transaction_amount"=>["can't be blank"], 
            "transaction_id"=>["can't be blank"], 
            "transaction_date"=>["can't be blank"], 
            "device_id"=>["can't be blank"], 
            "user_id"=>["can't be blank"]
          }
        }
    end
    it 'expect to return the proper payload' do
      expect(JSON.parse(response.body)['errors']['card_number']).to eq(["can't be blank"])
      expect(response.status).to eq(422)
    end
  end
end
