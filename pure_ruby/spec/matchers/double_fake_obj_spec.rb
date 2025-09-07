# spec/double_spec.rb
require 'rspec'

RSpec.describe "RSpec Doubles" do
  # ----- Example 1: expect to receive message -----
  it "expects a double to receive a message with chaining" do
    # create double
    calculator = double("Calculator")

    # allow chaining: calculator.add(2).multiply(3)
    expect(calculator).to receive(:add).with(2).and_return(double("Adder", multiply: 6))

    result = calculator.add(2).multiply(3)
    expect(result).to eq(6)
  end

  # ----- Example 2: allow to receive method -----
  it "allows a double to receive a method" do
    user = double("User")

    # stub method
    allow(user).to receive(:name).and_return("Gilberto")

    expect(user.name).to eq("Gilberto")
    expect(user.name).to eq("Gilberto")  # can call multiple times
  end
end

# | Feature                    | `expect(...).to receive`                    | `allow(...).to receive`                         |
# | -------------------------- | --------------------------------------------| ----------------------------------------------- |
# | Purpose                    | Expect method to be called during the test  | Stub method to return value without expectation |
# | Fails if method not called | Yes                                         | No                                              |
# | Can chain                  | Yes, using `.and_return(double(...))`       | Yes, but just returns value                     |
# | -------------------------- | --------------------------------------------| ----------------------------------------------- |

# A double is a test double (a fake object) that stands in for a real one during testing. 
# It’s useful when you don’t want to rely on slow or complex real objects (like APIs, DB calls, etc.).
# Common methods:
# double("Name")                             → creates a fake object named "Name".
# allow(...).to receive(...).and_return(...) → stubs a method (without expectation).
# expect(...).to receive(...)                → sets an expectation that the method must be called.
# types: mock, stub, spy, fake, dummy objects.