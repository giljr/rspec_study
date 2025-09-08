require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'Create a order for a customer association' do
    order = create(:order)
    expect(order.customer).to be_kind_of(Customer)
  end

  it 'Create 3 orders for a customer association' do
    customer = create(:traits_customer)
    order_list = create_list(:order, 3, customer: customer)
    expect(order_list.count).to eq(3)
  end
end
