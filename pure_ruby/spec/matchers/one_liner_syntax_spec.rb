RSpec.describe Array do
  # Define the subject of the test
  # This creates a named subject `numbers` referring to the array [1, 2, 3]
  subject(:numbers) { [1, 2, 3] }  

  # -------------------------------
  # One-liner syntax with implicit descriptions
  # `is_expected` is shorthand for `expect(subject)`
  # So this is equivalent to: expect(numbers).to include(2)
  # -------------------------------

  it { is_expected.to include(2) }       
  # Checks that the array includes the value 2
  # Implicit description generated: "includes 2"

  it { is_expected.not_to be_empty }     
  # Checks that the array is not empty
  # Implicit description generated: "does not be empty" (readable as "is not empty")

  it { is_expected.to match_array([1,2,3]) } 
  # Checks that the array contains exactly the elements [1,2,3], order doesn't matter
  # Equivalent to: expect(numbers).to match_array([1,2,3])
end
