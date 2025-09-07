class PaymentGateway
  def charge(amount)
    # Normally, this would connect to a real bank API
    "Approved: #{amount}"
  end
end