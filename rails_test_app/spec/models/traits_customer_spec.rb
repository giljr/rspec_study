# spec/factories/traits_customer_spec.rb
require "rails_helper"

RSpec.describe "Customer Factory with Traits" do
  context "base factory" do
    it "creates a valid customer" do
    customer = create(:traits_customer)
      expect(customer).to be_a(Customer)
      expect(customer.name).to be_present
      expect(customer.email).to be_present
      expect(customer.vip).to eq(false)
      expect(customer.days_to_pay).to eq(15)
    end
  end

  context "traits" do
    it "creates a VIP customer" do
      customer = create(:traits_customer, :vip)
      expect(customer.vip).to eq(true)
      expect(customer.days_to_pay).to eq(30)
    end

    it "creates a regular customer" do
      customer = create(:traits_customer, :regular)
      expect(customer.vip).to eq(false)
      expect(customer.days_to_pay).to eq(15)
    end

    it "creates a male customer" do
      customer = create(:traits_customer, :male)
      expect(customer.gender).to eq("male")
    end

    it "creates a female customer" do
      customer = create(:traits_customer, :female)
      expect(customer.gender).to eq("female")
    end

    it "creates a long-term customer" do
      customer = create(:traits_customer, :long_term)
      expect(customer.days_to_pay).to eq(60)
    end

    it "creates a short-term customer" do
      customer = create(:traits_customer, :short_term)
      expect(customer.days_to_pay).to eq(7)
    end
  end

  context "combined traits" do
    it "creates a VIP male customer" do
      customer = create(:vip_male_customer)
      expect(customer.vip).to eq(true)
      expect(customer.gender).to eq("male")
    end

    it "creates a VIP female customer" do
      customer = create(:vip_female_customer)
      expect(customer.vip).to eq(true)
      expect(customer.gender).to eq("female")
    end

    it "creates a regular male customer" do
      customer = create(:regular_male_customer)
      expect(customer.vip).to eq(false)
      expect(customer.gender).to eq("male")
    end

    it "creates a regular female customer" do
      customer = create(:regular_female_customer)
      expect(customer.vip).to eq(false)
      expect(customer.gender).to eq("female")
    end
  end

  context "with transient attributes" do
    it "assigns a custom credit card number" do
      custom_number = "4111111111111111"
      customer = create(:traits_customer, credit_card_number: custom_number)
      expect(customer.credit_card_number).to eq(custom_number)
    end

    it "generates a random credit card number by default" do
      customer = create(:traits_customer)
      expect(customer.credit_card_number).to be_present
    end
  end
end
