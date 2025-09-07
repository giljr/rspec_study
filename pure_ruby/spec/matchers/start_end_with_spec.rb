require 'rspec'

RSpec.describe "String start_with / end_with matchers" do
  it "passes when string starts with a prefix" do
    text = "hello world"
    expect(text).to start_with("hello")
  end

  it "fails when string does not start with a prefix" do
    text = "hello world"
    expect(text).not_to start_with("world")
  end

  it "passes when string ends with a suffix" do
    text = "hello world"
    expect(text).to end_with("world")
  end

  it "fails when string does not end with a suffix" do
    text = "hello world"
    expect(text).not_to end_with("hello")
  end
end
