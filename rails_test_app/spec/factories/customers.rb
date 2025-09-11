FactoryBot.define do
  factory :customer, aliases: [ :user ] do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    vip { false }
    days_to_pay { 15 }
    address { Faker::Address.street_address }
    gender { [ 'male', 'female', 'non-binary' ].sample }

    factory :vip_customer do
      vip { true }
      days_to_pay { 30 }
    end

    factory :regular_customer do
      vip { false }
      days_to_pay { 15 }
    end

    # Add credit card behavior
    transient do
      credit_card_number { Faker::Finance.credit_card(:visa) }
    end

    after(:build) do |customer, evaluator|
      # Attach transient credit card to a virtual attribute
      customer.define_singleton_method(:credit_card_number) do
        evaluator.credit_card_number
      end
    end
  end
end

# 🎬 Analogy
# Think of it like giving a temporary “post-it note” to the object:
# In DB → no credit_card_number column.
# In memory → we tape a sticky note saying “if anyone asks for credit_card_number, return this value.”

# ⚡️ So:
# Transient attribute (evaluator) = where the value lives.
# define_singleton_method = how we expose it on the model instance for test convenience.



# FactoryBot.define do
#   # Base customer factory
#   factory :customer, aliases: [:user] do
#     name { Faker::Name.name }
#     email { Faker::Internet.email }
#     vip { false }          # default to non-VIP
#     days_to_pay { 15 }     # default days for non-VIP

#     # VIP variant using inheritance
#     factory :vip_customer do
#       vip { true }
#       days_to_pay { 30 }
#     end

#     # Regular variant using inheritance
#     factory :regular_customer do
#       vip { false }
#       days_to_pay { 15 }
#     end
#   end
# end

# Benefits of this approach:
# You keep one base factory (:customer) for common attributes.
# You define specialized factories (:vip_customer, :regular_customer) for different behavior.
# When creating a VIP, you can just call create(:vip_customer) and it automatically has vip: true and days_to_pay: 30.

# FactoryBot.define do
#   factory :customer, aliases: [ :user ] do
#     name { Faker::Name.name }
#     email { Faker::Internet.email }

#     # Randomly assign VIP status
#     vip { [ true, false ].sample }

#     # Assign days_to_pay based on VIP status
#     days_to_pay { vip ? 30 : 15 }
#   end
# end

# FactoryBot definition for Customer
# Includes dynamic assignment of `vip` status and `days_to_pay`:
#   - `vip_customer` factory: vip = true, days_to_pay = 30
#   - `regular_customer` factory: vip = false, days_to_pay = 15
#   - `customer` factory: randomly assigns vip true/false, with corresponding days_to_pay
#
# Usage examples in specs:
#   create(:vip_customer)      # persisted customer, vip = true
#   create(:regular_customer)  # persisted customer, vip = false
#   create(:customer)          # persisted customer, random vip status


# To add the `vip` and `days_to_pay` columns to the customers table for use in this FactoryBot factory:
#   rails generate migration AddVipAndDaysToPayToCustomers vip:boolean days_to_pay:integer
# Then run:
#   rails db:migrate

# FactoryBot.define do
#   factory :customer do
#     name { "John Doe" }
#     email { "jdoe@example.com" }
#   end
# end

# Usage in specs:
#
# build(:<name>)  -> Creates an instance in memory only (not saved).
#                    Call .save or .save! if you want to persist it.
#
# create(:<name>) -> Creates and saves the instance to the database immediately.
#                    Requires a working DB connection since it calls .save! internally.
