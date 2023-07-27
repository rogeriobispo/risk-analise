class CreateTransaction
  def self.execute(params)
    Transaction.new(params)
  end
end
