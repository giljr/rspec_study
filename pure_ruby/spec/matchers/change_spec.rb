# ----------------------------------------
# RSpec test for Counter using change matcher
# ----------------------------------------

require "counter"   # <-- loads lib/counter.rb

RSpec.describe 'change matcher with let' do
  let(:counter) { Counter.new }   # new instance for every test

  it { expect { counter.increment }.to change { counter.value } }
  it { expect { counter.increment }.to change { counter.value }.by(1) }
  it { expect { counter.increment }.to change { counter.value }.from(0).to(1) }
end

=begin

require 'counter'

RSpec.describe 'change matcher' do
  

  it { expect{Counter.increment}.to change { Counter.value } }
  it { expect{Counter.increment}.to change { Counter.value }.by(1) }
  it { expect{Counter.increment}.to change { Counter.value }.from(0).to(1) }
end

=end