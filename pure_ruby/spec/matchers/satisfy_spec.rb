# spec/satisfy_spec.rb
require 'rspec'

RSpec.describe "RSpec satisfy matcher" do
  context "using expect(...).to satisfy" do
    it "checks if a number is even" do
      expect(4).to satisfy { |n| n.even? }
    end

    it "checks if a string has vowels" do
      expect("hello").to satisfy { |s| s =~ /[aeiou]/ }
    end

    it "checks array sum is greater than 10" do
      numbers = [3, 4, 5]
      expect(numbers).to satisfy("sum greater than 10") { |arr| arr.sum > 10 }
    end

    it "checks number is less than 100" do
      number = 42
      expect(number).to satisfy { |n| n < 100 }
    end
  end

  context "using the satisfy one-liner form" do
    it { expect(15).to satisfy { |n| n % 3 == 0 } }   # multiple of 3
    it { expect("ruby").to satisfy { |s| s.length < 10 } }
  end
end

# | Usage Style                      | Example                                                                      | Description                                  |
# |----------------------------------|------------------------------------------------------------------------------|----------------------------------------------|
# | Basic numeric check              | `expect(4).to satisfy { |n| n.even? }`                                       | Passes if the number is even.                |
# | String condition                 | `expect("hello").to satisfy { |s| s =~ /[aeiou]/ }`                          | Passes if the string has at least one vowel. |
# | Array condition with description | `expect([3, 4, 5]).to satisfy("sum greater than 10") { |arr| arr.sum > 10 }` | Custom description improves failure message. |
# | Comparison check                 | `expect(42).to satisfy { |n| n < 100 }`                                      | Passes if number is less than 100.           |
# | One-liner multiple of 3          | `it { expect(15).to satisfy { |n| n % 3 == 0 } }`                            | One-liner style, checks divisibility by 3.   |
# | One-liner string length          | `it { expect("ruby").to satisfy { |s| s.length < 10 } }`                     | One-liner, checks string length less than 10.|
# |----------------------------------|------------------------------------------------------------------------------|----------------------------------------------|
