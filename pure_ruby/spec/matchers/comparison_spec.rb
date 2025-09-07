# Each matcher (>, <, >=, <=, ==, ===) is correctly tested for both pass and fail cases.
RSpec.describe "comparison matchers" do
    describe "be >" do
        it "passes when actual is greater than expected" do
        expect(5).to be > 3
        end
    
        it "fails when actual is not greater than expected" do
        expect {
            expect(2).to be > 3
        }.to raise_error(RSpec::Expectations::ExpectationNotMetError, /expected: > 3\s+got:\s+2/)
        end
    end
    
    describe "be <" do
        it "passes when actual is less than expected" do
        expect(2).to be < 3
        end
    
        it "fails when actual is not less than expected" do
        expect {
            expect(5).to be < 3
        }.to raise_error(RSpec::Expectations::ExpectationNotMetError, /expected: < 3\s+got:\s+5/)
        end
    end
    
    describe "be >=" do
        it "passes when actual is greater than expected" do
        expect(5).to be >= 3
        end
    
        it "passes when actual is equal to expected" do
        expect(3).to be >= 3
        end
    
        it "fails when actual is less than expected" do
        expect {
            expect(2).to be >= 3
        }.to raise_error(RSpec::Expectations::ExpectationNotMetError, /expected: >= 3\s+got:\s+2/)
        end
    end
    
    describe "be <=" do
        it "passes when actual is less than expected" do
        expect(2).to be <= 3
        end
    
        it "passes when actual is equal to expected" do
        expect(3).to be <= 3
        end
    
        it "fails when actual is greater than expected" do
        expect {
            expect(5).to be <= 3
        }.to raise_error(RSpec::Expectations::ExpectationNotMetError, /expected: <= 3\s+got:\s+5/)
        end
    end
    
    describe "be ==" do
        it "passes when actual is equal to expected" do
        expect(3).to be == 3
        end
    
        it "fails when actual is not equal to expected" do
        expect {
            expect(2).to be == 3
        }.to raise_error(RSpec::Expectations::ExpectationNotMetError, /expected: == 3\s+got:\s+2/)
        end
    end 
    describe "be ===" do
        it "passes when actual is equal to expected" do
        expect(3).to be === 3
        end
    
        it "fails when actual is not equal to expected" do
        expect {
            expect(2).to be === 3
        }.to raise_error(RSpec::Expectations::ExpectationNotMetError, /expected: === 3\s+got:\s+2/)
        end
    end
end 