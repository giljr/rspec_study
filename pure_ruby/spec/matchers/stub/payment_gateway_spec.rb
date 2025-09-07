# frozen_string_literal: true

require 'payment_gateway'

RSpec.describe 'Stub example' do
  it 'stubs the response for test purposes' do
    gateway = PaymentGateway.new

    # Stub: force `charge` to return "Approved"
    allow(gateway).to receive(:charge).and_return('Approved')

    expect(gateway.charge(100)).to eq('Approved')   # ✅ forced response
    expect(gateway.charge(999)).to eq('Approved')   # ✅ always same
  end
end

# Key Idea
# Without stubs: charge would run real logic (maybe hit an API).
# With stubs: charge is faked → always returns "Approved".

# That’s why we say:
# 👉 “Stubs force a response to a specific method call on a collaborator object for testing purposes, without relying on its actual implementation.”
# What is a Stub in RSpec?
# A stub is a test double technique used to force a method on a collaborator object to return a specific response, regardless of its real implementation.
# It does not execute the actual code of the method.
# It simply replaces the method’s behavior with a predefined return value.
# The purpose is to make your test predictable and isolated from external factors (APIs, databases, random data, etc.).