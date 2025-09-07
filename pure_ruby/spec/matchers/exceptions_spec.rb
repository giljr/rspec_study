require 'rspec'

RSpec.describe "raise_exception matcher" do
  def boom
    raise "something went wrong"
  end

  def boom_with_type
    raise ArgumentError, "invalid argument!"
  end

  context "without arguments" do
    it "matches any exception" do
      expect { boom }.to raise_exception       # passes (any exception)
    end
  end

  context "with error class" do
    it "matches specific exception class" do
      expect { boom_with_type }.to raise_exception(ArgumentError)  # passes
      expect { boom_with_type }.not_to raise_exception(RuntimeError)
    end
  end

  context "with error message string" do
    it "matches by message content" do
      expect { boom }.to raise_exception("something went wrong")   # passes
    end
  end

  context "with class and message" do
    it "matches both class and message" do
      expect { boom_with_type }.to raise_exception(ArgumentError, "invalid argument!") # passes
    end
  end

  context "with regex message" do
    it "matches error message via regex" do
      expect { boom_with_type }.to raise_exception(ArgumentError, /invalid/)  # regex match
      expect { boom }.to raise_exception(/went wrong/)                        # regex only
    end
  end
end

# | Matcher Form                                      | Meaning                                                     |
# |---------------------------------------------------|-------------------------------------------------------------|
# | `raise_exception`                                 | Matches any exception                                       |
# | `raise_exception(ErrorClass)`                     | Matches a specific exception type                           |
# | `raise_exception("error message")`                | Matches exact error message                                 |
# | `raise_exception(ErrorClass, "error message")`    | Matches type + exact message                                |
# | `raise_exception(ErrorClass, /regex/)`            | Matches type + regex message                                |
# | `raise_exception(/regex/)`                        | Matches any exception with a message matching the regex     |
# |---------------------------------------------------|-------------------------------------------------------------|
