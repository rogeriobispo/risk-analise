class UserHasChargeBack
  def self.execute(user_id)
    return false if Transaction.exists?(user_id: user_id, has_cbk: true)

    EndValidations.execute
  end
end
