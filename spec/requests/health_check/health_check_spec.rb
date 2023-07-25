require_relative '../../spec_helper'

RSpec.describe 'health_check API'; type: :request do
  let(:response) { get '/' }
  let(:expected_response) { { 'message' => 'I am alive' } }

  it 'returns Im alive message' do
    expect(JSON.parse(response.body)).to eq(expected_response)
  end
end
