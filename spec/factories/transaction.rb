FactoryBot.define do
  factory :transaction do
    transaction_id { 123_456 }   
    merchant_id { 654_123 }
    user_id { 123 }
    card_number { '423069******2627' }
    transaction_date { Time.now - 1.second }
    transaction_amount { 234.56 }
    device_id { 1010 }
    has_cbk { false }
  end
end
