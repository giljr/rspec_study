# spec/custom_matcher_spec.rb
require 'rspec'

# ----- Custom Matcher -----
RSpec::Matchers.define :be_a_multiple_of do |expected|
  match do |actual|
    actual % expected == 0
  end

  failure_message do |actual|
    "❌ expected #{actual} to be a multiple of #{expected}"
  end

  failure_message_when_negated do |actual|
    "❌ expected #{actual} not to be a multiple of #{expected}"
  end

  description do
    "be a multiple of #{expected}"
  end
end

# ----- Using the Custom Matcher -----
RSpec.describe "Custom Matcher: be_a_multiple_of" do
  it "passes when the number is a multiple" do
    expect(10).to be_a_multiple_of(5)
  end

  it "fails when the number is not a multiple" do
    expect(10).not_to be_a_multiple_of(3)
  end
end

# Key parts of a custom matcher:
# match → logic of the matcher.
# failure_message → error message when it fails.
# failure_message_when_negated → message when the negated expectation fails.
# description → how RSpec prints the matcher in output.