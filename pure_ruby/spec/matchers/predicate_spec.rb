require 'rspec'

RSpec.describe "Predicate matchers" do
  context "be_nil" do
    it "passes if the value is nil" do
      value = nil
      expect(value).to be_nil   # nil.nil? → true
    end

    it "fails if the value is not nil" do
      value = "something"
      expect(value).not_to be_nil
    end
  end

  context "be_zero" do
    it "passes if the number is zero" do
      num = 0
      expect(num).to be_zero    # 0.zero? → true
    end

    it "fails if the number is not zero" do
      num = 42
      expect(num).not_to be_zero
    end
  end

  context "be_empty" do
    it "passes if the collection is empty" do
      arr = []
      str = ""
      expect(arr).to be_empty   # [].empty? → true
      expect(str).to be_empty   # "".empty? → true
    end

    it "fails if the collection has elements" do
      arr = [1]
      str = "hello"
      expect(arr).not_to be_empty
      expect(str).not_to be_empty
    end
  end
end


# | Matcher               | Ruby Method Called | Example Value                 | Result |
# |-----------------------|--------------------|-------------------------------|--------|
# | `be_nil`              | `nil?`             | `nil`                         | true   |
# | `be_zero`             | `zero?`            | `0`                           | true   |
# | `be_empty`            | `empty?`           | `[]`, `""`                    | true   |
# | `be_even`             | `even?`            | `2`                           | true   |
# | `be_odd`              | `odd?`             | `3`                           | true   |
# | `be_positive`         | `positive?`        | `5`                           | true   |
# | `be_negative`         | `negative?`        | `-1`                          | true   |
# | `be_frozen`           | `frozen?`          | `"hi".freeze`                 | true   |
# | `be_integer`          | `integer?`         | `42`                          | true   |
# | `be_a_multiple_of(n)` | `multiple_of?(n)`  | `10` (multiple of 5)          | true   |
# |-----------------------|--------------------|-------------------------------|--------|
