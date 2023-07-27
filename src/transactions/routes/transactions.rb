permited_params = [
  :transaction_id, 
  :merchant_id,
  :user_id,
  :card_number,
  :transaction_date,
  :transaction_amount,
  :device_id,
  :has_cbk 
]

post '/transactions', allows: permited_params do
  transaction = CreateTransaction.execute(params)

  if transaction.save
    status 200
    json transaction_id: transaction.transaction_id, recommendation: StartValidations.execute(transaction)
  else
    status 422
    json errors: transaction.errors.messages
  end
end

