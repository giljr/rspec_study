require 'rspec'

RSpec.describe "Email format validation" do
  let(:email_regex) { /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  it "passes when string is a valid email" do
    email = "user@example.com"
    expect(email).to match(email_regex)
  end

  it "fails when string is not a valid email" do
    invalid_email = "user@example"
    expect(invalid_email.match(email_regex)).to be_nil
  end

  it "fails when email contains two @ symbols" do
    bad_email = "user@@example.com"

    expect {
      expect(bad_email).to match(email_regex)
    }.to raise_error(RSpec::Expectations::ExpectationNotMetError, /expected "#{Regexp.escape(bad_email)}" to match/)
  end
end


# Explanation:

# \A and \z → match start and end of string.

# [\w+\-.]+ → matches username part (letters, digits, _, +, -, .).

# @[a-z\d\-.]+ → matches domain.

# \.[a-z]+ → matches TLD (like .com, .org).

# i → case-insensitive.
