class StartValidations
  def self.execute(transaction)
    card_number = transaction.card_number
    user_id = transaction.user_id

    if MaxTransactionInARow.execute(card_number, user_id)
      'APPROVE'
    else
      'DENY'
    end
  end
end
