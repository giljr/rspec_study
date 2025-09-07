# spec/models/transient_attrs_spec.rb
require 'rails_helper'

RSpec.describe Customer, type: :model do
  it "uses a transient credit card number - invisible but accessible" do
    customer = build(:customer, credit_card_number: "4111111111111111")
    customer.save! # persist to DB

    # Attribute is accessible in memory
    expect(customer.credit_card_number).to eq("4111111111111111")

    # Attribute is NOT persisted in DB
    persisted_customer = Customer.find(customer.id)
    expect(persisted_customer.attributes).not_to include("credit_card_number")
  end

  it "generates a random credit card number by default" do
    customer = build(:customer)
    customer.save! #

    # Debug prints
    puts "\n--- Customer Attributes from DB ---"
    puts customer.attributes

    puts "\n--- Transient credit card number ---"
    puts customer.credit_card_number  # transient attribute, exists in memory

    # Expectations
    expect(customer.credit_card_number).to be_a(String)
    expect(customer.credit_card_number.length).to be >= 13
  end
end

