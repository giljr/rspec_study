# spec/models/traits_customer_with_orders_spec.rb
require "rails_helper"

RSpec.describe "Customer Factory with :with_orders trait" do
  context "with_orders trait" do
    it "creates a customer with 3 associated orders" do
      customer = create(:traits_customer, :with_orders)

      expect(customer).to be_persisted
      expect(customer.orders.count).to eq(3)
      expect(customer.orders.first).to be_a(Order)
    end

    it "respects the transient qtt_orders attribute" do
      customer = create(:traits_customer, :with_orders, qtt_orders: 5)

      expect(customer.orders.count).to eq(5)
    end
  end
end
