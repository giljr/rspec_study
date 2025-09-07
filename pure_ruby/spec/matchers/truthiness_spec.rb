# “Veracidade” ou “Avaliação de verdade”

# be true, be false
# be_truthy, be_falsy, be_falsey
# be_nil
RSpec.describe 'Matchers - Comparison - Truthiness' do

    it 'be_truthy (truthy values)' do
        expect(1).to be_truthy   # 1 is truthy
        expect("hello").to be_truthy  # non-empty string is truthy
        expect([]).to be_truthy  # empty array is truthy
        expect({}).to be_truthy  # empty hash is truthy
        expect(Object.new).to be_truthy  # any object is truthy
    end

    it 'be_falsy (falsy/falsey values)' do
        expect(nil).to be_falsy  # nil is falsey
        expect(false).to be_falsy  # false is falsey or falsy
        expect(false).to be_falsey 
    end

    it 'be_nil (specifically nil)' do
        expect(nil).to be_nil  # specifically checks for nil
        expect(false).not_to be_nil  # false is not nil
        expect(0).not_to be_nil  # 0 is not nil
        expect("").not_to be_nil  # empty string is not nil
    end

    it 'be (exactly true or false)' do
        expect(true).to be(true)   # exactly true
        expect(false).to be(false) # exactly false
        expect(1).not_to be(true)  # 1 is not exactly true
        expect(nil).not_to be(false) # nil is not exactly false
    end
end
