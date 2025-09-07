require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'using attributes_for' do
    it 'generates a hash of attributes for a regular customer' do
      attrs = attributes_for(:customer)
    #   puts attrs

      expect(attrs).to include(:name, :email, :vip, :days_to_pay)
      expect(attrs[:vip]).to eq(false)
      expect(attrs[:days_to_pay]).to eq(15)
    end

    it 'generates a hash of attributes for a vip customer' do
      attrs = attributes_for(:vip_customer)
    #   puts attrs

      expect(attrs[:vip]).to eq(true)
      expect(attrs[:days_to_pay]).to eq(30)
    end

    it 'can be used to build a customer without persisting' do
      attrs = attributes_for(:customer)
      customer = Customer.new(attrs)
    #   puts attrs

      expect(customer).to be_a_new(Customer)
      expect(customer.vip).to be(false)
    end
  end
end

# attributes_for(:customer) returns only a hash of attributes (without associations or persistence), 
# which is very useful for controller specs or form submission tests.

# attributes_for from FactoryBot (not attributes_for?), 
# which returns a plain hash of attributes for building objects without saving them to the database.