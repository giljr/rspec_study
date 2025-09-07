require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'creates a valid customer with name and email' do
    customer = build(:customer)
    customer.save!

    aggregate_failures 'validating customer attributes' do
      expect(customer).to be_persisted
      expect(customer.full_name).to start_with('Mr./Ms.')
      expect(customer.full_name).to include(customer.name)
      expect(customer.email).to match(/\A[^@\s]+@[^@\s]+\z/)
      expect(customer.name).to be_present
      expect(customer.email).to be_present
    end
  end

  it 'assigns correct vip status and days_to_pay using inherited factories' do
    vip_customer = create(:vip_customer)
    regular_customer = create(:regular_customer)
    random_customer = create(:customer)

    aggregate_failures 'checking VIP and days_to_pay' do
      # VIP customer
      expect(vip_customer.vip).to be true
      expect(vip_customer.days_to_pay).to eq(30)

      # Regular customer
      expect(regular_customer.vip).to be false
      expect(regular_customer.days_to_pay).to eq(15)

      # Random customer (either VIP or not)
      expect([true, false]).to include(random_customer.vip)
      expected_days = random_customer.vip ? 30 : 15
      expect(random_customer.days_to_pay).to eq(expected_days)
    end
  end
end

# Benefits of aggregate_failures:
# All expectations inside the block are evaluated.
# Multiple failures are reported together instead of stopping at the first one.
# Cleaner and easier to read for attribute-heavy objects like your customer.