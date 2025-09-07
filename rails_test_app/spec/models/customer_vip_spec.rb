# spec/models/customer_vip_spec.rb
require 'rails_helper'

RSpec.describe 'Customer VIP and Payment Attributes', type: :model do
  it 'creates a VIP customer with correct days_to_pay' do
    customer = create(:customer, vip: true, days_to_pay: 30)

    expect(customer).to be_persisted
    expect(customer.vip).to be true
    expect(customer.days_to_pay).to eq(30)
  end

  it 'creates a non-VIP customer with custom days_to_pay' do
    customer = create(:customer, vip: false, days_to_pay: 15)

    expect(customer).to be_persisted
    expect(customer.vip).to be false
    expect(customer.days_to_pay).to eq(15)
  end
end
