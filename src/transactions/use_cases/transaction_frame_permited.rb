class TransactionFramePerminted 
  def self.execute(card_number, user_id)
    amount_max = ENV['AMOUNT_MAX']
    frame = ENV['HOURS_FRAME'].to_i

    transaction = Transaction.where(card_number: card_number, transaction_date: Time.now - frame.hours... Time.now)

    return false if transaction.sum(:transaction_amount) > amount_max.to_f

    UserHasChargeBack.execute(user_id)
  end
end