require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'creates a valid customer with name and email' do
    # Option A: build(:customer) creates the object in memory only.
    customer = build(:customer)
    # customer = build(:customer, name: "John Doe")  # subscribing attributes
    # To test data in DB go to rails_helper.rb and set config.use_transactional_fixtures = false

    customer = build(:user)  # Using alias defined in factory , aliases: [:user]

    # Option B: create(:customer) persists the object directly in the DB.
    # Uncomment this line if you want the record saved immediately:
    # customer = create(:customer)

    # Explicitly save when using build(:customer)
    customer.save!

    # Ensure the record actually exists in the database
    expect(customer).to be_persisted

    # Verify that full_name has the expected format
    expect(customer.full_name).to start_with('Mr./Ms.')
    expect(customer.full_name).to include(customer.name)

    # Email should look like a valid address
    expect(customer.email).to match(/\A[^@\s]+@[^@\s]+\z/)

    # Name and email should not be blank
    expect(customer.name).to be_present
    expect(customer.email).to be_present
  end


  it { expect { create(:customer) }.to change { Customer.count }.by(1) }
  # it { expect { create(:customer, vip: false, days_to_Pay: 10) }.to be_false }

  # What’s clever here:
  # Uses be_persisted matcher → ensures the record really hit the DB.
  # Uses start_with + include → checks full_name dynamically without hardcoding "John Doe".
  # Uses match with regex     → ensures email format is valid, regardless of randomness.
  # Uses be_present           → Rails-y matcher that checks for non-blank attributes.

  # fixtures :customers
  #   it 'Create a Customer' do
  #   customer = customers(:jdoe)
  #   # subject.name = 'John Doe'
  #   # subject.email = 'jdoe@example.com'
  #   # subject.save
  #   expect(customer).to be_persisted
  #   expect(customer.full_name).to eq('Mr./Ms. John Doe')
  # end

  # it 'Create a Customer' do
  #   # Modify the model
  #   subject.name = 'John Doe'
  #   subject.email = 'jdoe@example.com'
  #   subject.save
  #   expect(subject).to be_persisted
  #   expect(subject.full_name).to eq('Mr./Ms. John Doe')
  # end

  # it 'Create a Customer' do
  #   # customer = Customer.new
  #   subject.name = 'John Doe'
  #   subject.email = 'jdoe@example.com'
  #   subject.save
  #   expect(subject).to be_persisted
  #   expect(subject.name).to eq('John Doe')
  #   expect(subject.email).to eq('jdoe@example.com')
  # end

  # it 'Create a Customer' do
  #   customer = Customer.new
  #   customer.name = 'John Doe'
  #   customer.email = 'jdoe@example.com'
  #   customer.save
  #   expect(customer).to be_persisted
  #   expect(customer.name).to eq('John Doe')
  #   expect(customer.email).to eq('jdoe@example.com')
  # end

  # it 'Create a Customer' do
  #   customer = Customer.create(name: 'John Doe', email: 'jdoe@example.com')
  #   expect(customer).to be_persisted
  #   expect(customer.name).to eq('John Doe')
  #   expect(customer.email).to eq('jdoe@example.com')
  # end
end
