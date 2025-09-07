# Global counter to demonstrate let memoization
$counter = 0

RSpec.describe 'let memoization' do
  # `let` lazily evaluates and memoizes the value **per example**
  let(:count) { $counter += 1 }

  it '1 - memoizes the value within the same example', :one do
    # First call to `count` evaluates the block => $counter becomes 1
    expect(count).to eq(1)
    # Second call in the same example returns memoized value, not incremented
    expect(count).to eq(1)
  end

  it '2 - does not cache between examples', :two do
    # New example: let block re-evaluates => $counter increments to 2
    expect(count).to eq(2)
  end
end
