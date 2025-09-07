RSpec.describe 'as_null_object example' do
  it 'ignores unexpected messages' do
    mock = double('PermissiveMock').as_null_object

    # You can call methods that are not explicitly stubbed
    expect { mock.any_method }.not_to raise_error
    expect { mock.another_method(1, 2) }.not_to raise_error

    # You can still stub methods and control return values
    allow(mock).to receive(:greet).and_return('Hello!')
    expect(mock.greet).to eq('Hello!')
  end
end

# In RSpec, as_null_object allows a test double to ignore unexpected messages instead of raising an error. 
# It’s useful when you want a “permissive” mock that won’t fail if methods are called that you haven’t explicitly stubbed.