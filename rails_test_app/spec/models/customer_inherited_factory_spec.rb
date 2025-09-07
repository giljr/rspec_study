require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'creates a valid customer with name and email' do
    # Using build to create an instance without immediately saving
    customer = build(:customer)
    customer.save! # Persist to DB

    # Ensure customer was saved
    expect(customer).to be_persisted

    # Check full_name formatting
    expect(customer.full_name).to start_with('Mr./Ms.')
    expect(customer.full_name).to include(customer.name)

    # Validate email format
    expect(customer.email).to match(/\A[^@\s]+@[^@\s]+\z/)

    # Ensure name and email are present
    expect(customer.name).to be_present
    expect(customer.email).to be_present
  end

  it 'assigns correct vip status and days_to_pay using inherited factories' do
    # Using inherited factories
    vip_customer = create(:vip_customer)
    regular_customer = create(:regular_customer)
    random_customer = create(:customer) # could be vip or not

    # VIP customer checks
    expect(vip_customer.vip).to be true
    expect(vip_customer.days_to_pay).to eq(30)

    # Regular customer checks
    expect(regular_customer.vip).to be false
    expect(regular_customer.days_to_pay).to eq(15)

    # Random customer checks
    expect([true, false]).to include(random_customer.vip)
    if random_customer.vip
      expect(random_customer.days_to_pay).to eq(30)
    else
      expect(random_customer.days_to_pay).to eq(15)
    end
  end
end
