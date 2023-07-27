class MaxTransactionInARow 
  def self.execute(card_number, user_id)
    max_transaction = ENV['MAX_TRANSACTION_IN_A_ROW']
    frame = ENV['MAX_TRANSACTION_IN_A_ROW_FRAME'].to_i

    transaction = Transaction.where(user_id: user_id, transaction_date: Time.now - frame.hours... Time.now)

    return false if transaction.count > max_transaction.to_i

    TransactionFramePerminted.execute(card_number, user_id)
  end
end