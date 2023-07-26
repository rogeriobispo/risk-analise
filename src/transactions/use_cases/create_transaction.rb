class CreateTransaction
  def self.execute(params)
    transaction = Transaction.new(params)
  end
end
