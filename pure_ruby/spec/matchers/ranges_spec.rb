RSpec.describe "range matchers" do      
  describe "be_within" do
    it "passes when the value is within the range" do
      expect(5).to be_within(3).of(7)
    end

    it "fails when the value is outside the range" do
      expect {
        expect(10).to be_within(2).of(7)
      }.to raise_error(
        RSpec::Expectations::ExpectationNotMetError,
        /expected 10 to be within 2 of 7/
      )
    end
  end

  describe "cover" do
    it "passes when the range covers the value" do
      expect((1..10)).to cover(5)
    end

    it "fails when the range does not cover the value" do
      expect {
        expect((1..10)).to cover(15)
      }.to raise_error(
        RSpec::Expectations::ExpectationNotMetError,
        /expected 1\.\.10 to cover 15/
      )
    end
  end
end
