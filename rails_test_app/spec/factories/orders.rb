FactoryBot.define do
  factory :order do
    sequence(:description) { |n| "Order Nº #{n}" }
    
    association :customer, factory: :traits_customer # subscribing to the traits_customer factory
    # customer # association with customer factory automatically created
  end
end
