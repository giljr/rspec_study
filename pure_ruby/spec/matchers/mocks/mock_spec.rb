# Stubs are used during the setup phase of xUnit tests to simulate state changes.
# Mocks are used during the verification phase to test and assert behavior.

require 'rspec'

RSpec.describe 'Mocking and Stubbing in RSpec' do
  before(:each) do
    @mock = double('MockObject')
  end

  context 'Stubbing' do
    it 'allows you to stub methods on a mock object' do
      allow(@mock).to receive(:greet).and_return('Hello, World!')
      expect(@mock.greet).to eq('Hello, World!')
    end

    it 'can stub methods with arguments' do
      allow(@mock).to receive(:add).with(2, 3).and_return(5)
      expect(@mock.add(2, 3)).to eq(5)
    end

    it 'can stub methods to raise exceptions' do
      allow(@mock).to receive(:fail).and_raise(StandardError)
      expect { @mock.fail }.to raise_error(StandardError)
    end
  end

  context 'Mocking' do
    it 'allows you to set expectations on method calls' do
      expect(@mock).to receive(:greet).once.and_return('Hello, Mock!')
      @mock.greet
    end

    it 'can set expectations with arguments' do
      expect(@mock).to receive(:add).with(4, 5).once.and_return(9)
      @mock.add(4, 5)
    end

    it 'verifies that the expected method was called' do
      expect(@mock).to receive(:process).once
      @mock.process
    end

    it 'fails if the expected method is not called' do
      mock = double('mock')

      # Set expectation
      expect(mock).to receive(:missing_method).once

      # Do NOT call the method
      # RSpec will automatically fail this example at the end

      # mock.missing_method
    end
  end
end

# So the failure is not a bug — it’s demonstrating the difference between stubs and mocks:
# Stub: just returns values, does not fail if not called.
# Mock: verifies that the method is called, fails if it’s not.
# Key points:
# This failure is correct — it proves that RSpec is verifying the expectation.
# If you actually call the method:
