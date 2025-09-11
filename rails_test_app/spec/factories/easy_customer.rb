# spec/factories/easy_customer.rb
FactoryBot.define do
  factory :easy_customer, class: "Customer", aliases: [:easy_user] do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    vip { false }
    days_to_pay { 15 }
    address { Faker::Address.street_address }

    transient do
      credit_card_number { Faker::Finance.credit_card(:visa) }
    end

    after(:build) do |customer, evaluator|
      customer.credit_card_number = evaluator.credit_card_number
    end
  end
end
