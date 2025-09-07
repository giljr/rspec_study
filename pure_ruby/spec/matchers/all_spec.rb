# frozen_string_literal: true

RSpec.describe 'all matcher' do
  context 'with numbers' do
    subject(:numbers) { [1, 3, 5, 7, 9] }

    it { is_expected.to all(be_odd) } # checks that all elements are odd
  end

  context 'with strings' do
    subject(:words) { %w[hello world rspec] }

    it { is_expected.to all(be_a(String)) } # checks that all elements are Strings
  end
end

# Using → # frozen_string_literal: true → at the top of a Ruby file is a magic comment 
# that tells Ruby to make all string literals in that file immutable (frozen) by default.
# Why is that beneficial?
# → Performance optimization
# → Ruby normally creates a new object each time you write "some string".
# → With frozen string literals, the same literal is reused (no new allocations).
# → This reduces memory usage and speeds up string handling.