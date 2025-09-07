require 'user'

RSpec.describe User do
  let(:user) { User.new(name: "Alice", age: 25, email: "alice@example.com") }

  context "validations with aggregate_failures" do
    # Using block form
    it "checks multiple attributes at once" do
      aggregate_failures "validating user attributes" do
        expect(user.name).to eq("Bob")        # FAIL
        expect(user.age).to eq(30)            # FAIL
        expect(user.email).to eq("alice@example.com") # PASS
      end
    end

    # Alternative shorthand: remove block and use metadata
    it "checks multiple attributes at once (shorthand)", :aggregate_failures do
      expect(user.name).to eq("Bob")        # FAIL
      expect(user.age).to eq(30)            # FAIL
      expect(user.email).to eq("alice@example.com") # PASS
    end
  end
end

=begin
Explanation:

1. aggregate_failures block:
   - Wrap multiple expectations.
   - All failures are reported together, instead of stopping at the first.

2. Shorthand metadata:
   - Use :aggregate_failures metadata on it or describe.
   - Example: it "example", :aggregate_failures do ... end
   - Alternatively: it "example", aggregate_failures: true do ... end

3. Sample output when multiple expectations fail:

  1) User validations with aggregate_failures checks multiple attributes at once
     Got 2 failures from failure aggregation block "validating user attributes".

     1.1) expected: "Bob"
          got: "Alice"

     1.2) expected: 30
          got: 25

4. Global configuration (optional):

RSpec.configure do |config|

  config.define_derived_metadata do |meta|
    meta[:aggregate_failures] = true
  end
  
end

- Enables aggregation by default for all examples.
=end
