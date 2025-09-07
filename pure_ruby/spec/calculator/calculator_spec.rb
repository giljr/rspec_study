require 'calculator'

# RSpec tests for Calculator class
# Demonstrates: subject usage, context blocks, hooks, and error expectations
# Hooks Added:
# before(:all) / after(:all) at the describe and context level → run once per scope.
# before(:each) at the context level → runs before every individual example.

RSpec.describe Calculator, " - This is my first class" do
  # Explicit subject with custom name for clarity
  subject(:calc) { described_class.new }

  # -------------------
  # Suite-level hooks (run once for the entire describe block)
  # -------------------
  before(:all) do
    puts ">>> [before(:all)] Starting all tests for Calculator"
  end

  after(:all) do
    puts ">>> [after(:all)] Finished all tests for Calculator"
  end

  # -------------------
  # Context-level hooks (run before/after each context block)
  # -------------------
  context '#divide' do
    before(:all) { puts ">>> Starting divide tests" }
    after(:all)  { puts ">>> Finished divide tests" }

    # Example-level hook (run before each example in this context)
    before(:each) { puts ">>> Before each divide test" }

    it 'TEST1 - raises error when dividing by zero', :div_1 do
      # Using explicit subject `calc` to call method
      # Expecting a ZeroDivisionError with message matching /divided by 0/
      expect { calc.div(3, 0) }.to raise_error(ZeroDivisionError, /divided by 0/)
    end
  end

  context '#sum' do
    before(:all) { puts ">>> Starting sum tests" }
    after(:all)  { puts ">>> Finished sum tests" }

    before(:each) { puts ">>> Before each sum test" }

    it 'TEST2 - sums two positive numbers' do
      expect(calc.sum(3, 3)).to eq(6)
    end

    it 'TEST3 - sums a negative and a positive number' do
      expect(calc.sum(-3, 3)).to eq(0)
    end

    it 'TEST4 - sums two negative numbers' do
      expect(calc.sum(-3, -3)).to eq(-6)
    end
  end
end

# In pure Ruby projects, the concept of :suite hooks doesn’t exist exactly like in Rails/RSpec full-stack projects.
# before(:suite) and after(:suite) are RSpec/Rails-specific and only work if you have rspec-rails loaded, because they hook into the RSpec test runner lifecycle.
# In a plain Ruby project, you can still use before(:all) and after(:all) at the top-level RSpec.describe blocks to simulate "suite-like" behavior.