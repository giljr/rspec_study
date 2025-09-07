RSpec::Matchers.define_negated_matcher :not_include, :include

RSpec.describe Array do
  subject(:array) { [1, 2, 3] }

  describe '#length' do
    it '1 - returns the number of elements', :one do
      expect(array.length).to eq(3)
    end
  end

  describe '#include?' do
    it '2 - returns true if the element is present', :two do
      expect(array).to include(2)
      expect(array).not_to include(4) # additional negative test
    end

    it '3 - returns false if the element is missing', :three do
      expect(array).not_to include(99)
    end
  end

  describe '#empty?' do
    context 'when the array has elements' do
      it '4 - is not empty', :four do
        expect(array).not_to be_empty
      end
    end

    context 'when the array has no elements' do
      subject(:array) { [] }

      it '5 - is empty', :five do
        expect(array).to be_empty
      end
    end
  end

  describe '#first' do
    it '6 - returns the first element', :six do
      expect(array.first).to eq(1)
    end
  end

  describe '#last' do
    it '7 - returns the last element', :seven do
      expect(array.last).to eq(3)
    end
  end

  describe 'matchers' do
    subject(:array) { [1, 2, 3] }

    it '8 - validates array contents', :eight do
      expect(array).to include(2)
      expect(array).to match_array([1, 2, 3])
      expect(array).to contain_exactly(3, 2, 1)
    end
  end
end
