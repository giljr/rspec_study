# equal / be → compare object identity (equal? in Ruby) → be = seja objeto.
# eql   / eq → compare value equality (== or eql?) → eq is alias for eql.

RSpec.describe 'Matchers - Comparison - Equivalence' do

    it 'equal (object identity)' do
        a = "hello"
        b = "hello"

        expect(a).not_to equal(b)  # checks for object identity (same object in memory)
        expect(a).not_to be(b) # checks for object identity (same object in memory)
    end

    it 'be (object identity)' do
        a = "hello"
        b = a   # <== make b point to the same object

        expect(a).to be(b)  # checks for object identity (same object in memory)
        expect(a).to equal(b) # checks for object identity (same object in memory)
    end

    it 'eql (value equality)' do
        a = "hello"
        b = "hello"

        expect(a).to eql(b)  # checks for value equality
        expect(a).to eq(b)   # checks for value equality
    end

    it 'eq (value equality)' do
        a = "hello"
        b = "hello"

        expect(a).to eq(b)   # checks for value equality
        expect(a).to eql(b)  # checks for value equality
    end
end
 