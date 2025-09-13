require 'rails_helper'

RSpec.describe Customer, type: :model do
  it "uses an easy transient credit card number, invisible but accessible" do
    customer = build(:easy_customer, credit_card_number: "4111111111111111")

    # puts "\nDB attributes:"
    # puts customer.attributes

    # puts "\nTransient attribute:"
    # puts customer.credit_card_number

    expect(customer.credit_card_number).to eq("4111111111111111")
    expect(customer.attributes).not_to include("credit_card_number")
  end
end
