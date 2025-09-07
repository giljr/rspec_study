class User
  attr_accessor :first_name, :email

  alias name first_name
end

RSpec.describe User do
  let(:user) do
    u = User.new
    u.first_name = "Alice"
    u.email = "alice@example.com"
    u
  end

  it "verifies attributes using have_attributes" do
    expect(user).to have_attributes(first_name: "Alice", email: "alice@example.com")
  end

  it "also works with alias method" do
    expect(user).to have_attributes(name: "Alice")
  end

  it "supports alias matcher for readability" do
    RSpec::Matchers.alias_matcher :have_user_info, :have_attributes
    expect(user).to have_user_info(first_name: "Alice", email: "alice@example.com")
  end
end

# | Alias Matcher                          | Original Matcher                   | Works in        | Description                                  |
# |----------------------------------------|------------------------------------|-----------------|----------------------------------------------|
# | `a_truthy_value`                       | `be_truthy`                        | RSpec (Ruby)    | a truthy value                               |
# | `a_falsey_value`, `be_falsy`           | `be_falsey`                        | RSpec (Ruby)    | a falsey value                               |
# | `a_nil_value`                          | `be_nil`                           | RSpec (Ruby)    | a nil value                                  |
# | `an_instance_of(Integer)`              | `be_an_instance_of(Integer)`       | RSpec (Ruby)    | an exact instance of Integer                 |
# | `a_kind_of(Integer)`                   | `be_a_kind_of(Integer)`            | RSpec (Ruby)    | a kind of Integer (including subclasses)     |
# | `a_value_between(1, 10)`               | `be_between(1, 10)`                | RSpec (Ruby)    | a value between 1 and 10 (inclusive)         |
# | `a_value_within(0.1).of(3)`            | `be_within(0.1).of(3)`             | RSpec (Ruby)    | a value within 0.1 of 3                      |
# | `a_block_changing`                     | `change`                           | RSpec (Ruby)    | a block changing its result                  |
# | `a_collection_containing_exactly(…)`   | `contain_exactly(…)`               | RSpec (Ruby)    | a collection containing exactly those values |
# | `alias_attribute :new, :old`           | Rails `alias_attribute`            | Rails only      | creates an *attribute alias* (ActiveRecord)  |
# | `alias new old`                        | Ruby `alias`                       | Ruby core       | creates a *method alias*                     |
# |----------------------------------------|------------------------------------|-----------------|----------------------------------------------|

# Use RSpec::Matchers.alias_matcher to create expressive, custom names for matchers for domain-specific readability.