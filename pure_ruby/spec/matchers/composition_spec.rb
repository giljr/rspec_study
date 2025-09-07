RSpec.describe Array do
  subject(:numbers) { [1, 2, 3] }

  describe "composed expectations" do
    it "checks multiple conditions with `and`" do
      # The array should include 1 AND 3
      expect(numbers).to include(1).and include(3)
    end

    it "checks multiple conditions with `or`" do
      # The array should include 4 OR include 2
      expect(numbers).to include(4).or include(2)
    end

    it "combines `and` and `or` for complex logic" do
      # The array should include 1 AND (include 2 OR include 5)
      expect(numbers).to include(1).and (include(2).or include(5))
    end

    context "with strings" do
      let(:fruits) { ["apple", "banana", "cherry"] }

      it "uses composed expectations with strings" do
        # The array should include "banana" AND "cherry"
        expect(fruits).to include("banana").and include("cherry")

        # The array should include at least one of these values
        expect(fruits).to include("banana").or include("apple").or include("cherry")
      end
    end
  end
end
