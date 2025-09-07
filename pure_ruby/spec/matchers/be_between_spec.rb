RSpec.describe "be_between matcher" do
  describe "be_between with inclusive range" do
    it "passes when actual is within the inclusive range" do
      expect(5).to be_between(3, 7).inclusive
      expect(3).to be_between(3, 7).inclusive
      expect(7).to be_between(3, 7).inclusive
    end

    it "fails when actual is outside the inclusive range" do
      expect {
        expect(2).to be_between(3, 7).inclusive
      }.to raise_error(RSpec::Expectations::ExpectationNotMetError, /expected 2 to be between 3 and 7 \(inclusive\)/)

      expect {
        expect(8).to be_between(3, 7).inclusive
      }.to raise_error(RSpec::Expectations::ExpectationNotMetError, /expected 8 to be between 3 and 7 \(inclusive\)/)
    end
  end

  describe "be_between with exclusive range" do
    it "passes when actual is within the exclusive range" do
      expect(5).to be_between(3, 7).exclusive
    end

    it "fails when actual is on the boundary of the exclusive range" do
      expect {
        expect(3).to be_between(3, 7).exclusive
      }.to raise_error(RSpec::Expectations::ExpectationNotMetError, /expected 3 to be between 3 and 7 \(exclusive\)/)

      expect {
        expect(7).to be_between(3, 7).exclusive
      }.to raise_error(RSpec::Expectations::ExpectationNotMetError, /expected 7 to be between 3 and 7 \(exclusive\)/)       
    end

    it "fails when actual is on the boundary of the exclusive range" do
        expect {
            expect(3).to be_between(3, 7).exclusive
        }.to raise_error(RSpec::Expectations::ExpectationNotMetError, /expected 3 to be between 3 and 7 \(exclusive\)/)

        expect {
            expect(7).to be_between(3, 7).exclusive
        }.to raise_error(RSpec::Expectations::ExpectationNotMetError, /expected 7 to be between 3 and 7 \(exclusive\)/)
        end
  end
end
