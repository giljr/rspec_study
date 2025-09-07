# spec/shared_examples/math_shared_examples.rb
require 'rspec'

# ----- Shared Examples -----
RSpec.shared_examples "a positive number" do
  it "is greater than zero" do
    expect(subject).to be > 0
  end
end

RSpec.shared_examples "an even number" do
  it "is divisible by 2" do
    expect(subject % 2).to eq(0)
  end
end

# ----- Using Shared Examples -----
RSpec.describe "Shared Examples Demo" do
  context "when subject is 4" do
    subject { 4 }

    # 1. include_examples
    include_examples "a positive number"
    include_examples "an even number"
  end

  context "when subject is 10" do
    subject { 10 }

    # 2. it_behaves_like
    it_behaves_like "a positive number"
    it_behaves_like "an even number"
  end

  context "when subject is 2" do
    subject { 2 }

    # 3. it_should_behave_like
    it_should_behave_like "a positive number"
    it_should_behave_like "an even number"
  end
end

# Key points
# include_examples → inserts examples directly.
# it_behaves_like → adds examples under a nested it behaves like block.
# it_should_behave_like → alias for it_behaves_like (kept for backward compatibility).