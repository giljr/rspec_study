# lib/counter.rb
class Counter
  attr_reader :value

  def initialize
    @value = 0
  end

  def increment
    @value += 1
  end
end

=begin
# -------------------------
# Why instance-based Counter?
# -------------------------

✅ Encapsulation:
   - Each Counter object has its own @value.
   - No global/shared state → safer and easier to reason about.

✅ Test isolation:
   - In RSpec, each test can use `let(:counter) { Counter.new }`.
   - Ensures no leakage of state between tests.

✅ Flexibility:
   - You can create multiple independent counters:
       a = Counter.new
       b = Counter.new
       a.increment   # only affects `a`

✅ Idiomatic Ruby:
   - Ruby classes are generally instance-oriented.
   - `initialize` is the conventional way to set up object state.

# ------------------------------
# Comparison: Class vs Instance
# ------------------------------

🔴 Old (class-level state):

class Counter
  @qtd = 0

  def self.increment
    @qtd += 1
  end

  def self.value
    @qtd
  end
end

- Uses class instance variable (@qtd).
- Only one global counter exists.
- Tests interfere with each other (shared state).
- Harder to reset between examples.

🟢 New (instance-based state):

class Counter
  attr_reader :value

  def initialize
    @value = 0
  end

  def increment
    @value += 1
  end
end

- Each instance has its own @value.
- Multiple independent counters possible.
- Tests are isolated (fresh instance each time).
- Cleaner, more maintainable design.

# ------------------------------
# Note on `require` vs `require_relative`
# ------------------------------

- Use `require_relative` for your own project files.
- Use `require` for standard libraries or gems.

Examples:
  require_relative "counter"   # loads ./counter.rb relative to current file
  require "./counter"          # loads from working directory
  require "json"               # loads a standard lib or gem

=end
