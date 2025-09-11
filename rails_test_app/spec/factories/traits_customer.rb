# spec/factories/easy_customer.rb
FactoryBot.define do
  factory :traits_customer, class: "Customer", aliases: [:traits_user] do
    name  { Faker::Name.name }
    # sequence(:email) { |n| "my_email-#{n}@sequence.com" } # ensures unique emails using a sequence
    # sequence(:email, 32) { |n| "my_email-#{n}@sequence.com" } # runs from 32 to avoid collisions with other factories
    # sequence(:email, 'j') { |n| "my_email-#{n}@sequence.com" } # uses any object that implement next
    email { Faker::Internet.email }
    vip   { false }
    days_to_pay { 15 }
    gender { "male" }
    address { Faker::Address.street_address }

    transient do
      credit_card_number { Faker::Finance.credit_card(:visa) }
      qtt_orders { 3 }
    end

    after(:build) do |customer, evaluator|
      customer.credit_card_number = evaluator.credit_card_number
    end

    # --- Traits ---

    trait :vip do
      vip { true }
      days_to_pay { 30 }
    end

    trait :regular do
      vip { false }
      days_to_pay { 15 }
    end

    trait :male do
      gender { "male" }
    end

    trait :female do
      gender { "female" }
    end

    trait :long_term do
      days_to_pay { 60 }
    end

    trait :short_term do
      days_to_pay { 7 }
    end

    # Association (has_many) - see transient attribute above: qtt_orders { 3 }
    trait :with_orders do
      after(:create) do |customer, evaluator|
        create_list(:order, evaluator.qtt_orders, customer: customer)
      end
    end


    # Combinations of traits
    factory :vip_male_customer, traits: [:vip, :male]
    factory :vip_female_customer, traits: [:vip, :female]
    factory :regular_male_customer, traits: [:regular, :male]
    factory :regular_female_customer, traits: [:regular, :female]
    factory :vip_long_term_customer, traits: [:vip, :long_term]
  end
end

# Tests:
# create(:easy_customer) # Regular client
# create(:easy_customer, :vip) # VIP client
# create(:easy_customer, :female, :long_term) # Female client with long payment terms
# create(:vip_male_customer) # using combined factory
