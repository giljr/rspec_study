RSpec::Matchers.define_negated_matcher :not_be_within, :be_within

RSpec.describe "be within matcher - delta" do
  it { expect(11.5).to be_within(0.5).of(12) }

  it do
    expect([11.6, 12.1, 12.4]).to all(be_within(0.5).of(12.0))
  end

  it { expect(11.4).not_to be_within(0.5).of(12) } # Adicional negative test

  # Delta 0.5
  # Values considered within the range:
  # 11.5 - 11.6 - 11.7 - 11.8 - 11.9 - 12.0 - 12.1 - 12.2 - 12.3 - 12.4 - 12.5
end
