require 'rspec'

class Animal
  def speak
    "generic sound"
  end
end

class Dog < Animal
  def bark
    "woof!"
  end
end

RSpec.describe "RSpec matchers for type checking" do
  let(:dog) { Dog.new }

  it "checks with be_instance_of" do
    # Must be *exactly* Dog (no subclasses, no inheritance)
    expect(dog).to be_instance_of(Dog)   #  passes
    expect(dog).not_to be_instance_of(Animal) #  Dog is not exactly Animal
  end

  it "checks with be_kind_of / be_a / be_an" do
    # Matches class or superclass (inheritance chain works)
    expect(dog).to be_kind_of(Dog)      # 
    expect(dog).to be_kind_of(Animal)   # Dog < Animal
    expect(dog).to be_a(Dog)            # alias for be_kind_of
    expect(dog).to be_an(Animal)        # another alias
  end

  it "checks with respond_to" do
    # Looks for available methods (duck typing style)
    expect(dog).to respond_to(:bark)     # defined in Dog
    expect(dog).to respond_to(:speak)    # inherited from Animal
    expect(dog).not_to respond_to(:meow) # not defined
  end
end


# | Matcher                | Meaning                                                                                      | Example                                                                 |
# |-------------------------|-------------------------------------------------------------------------|-------------------------------------------------------------------------|
# | **`be_instance_of`**    | Object must be an **exact instance** of the given class. No inheritance allowed.            | `Dog.new` → ✅ `be_instance_of(Dog)` <br> ❌ `be_instance_of(Animal)` |
# | **`be_kind_of` / `be_a` / `be_an`** | Object must be an instance of the given class **or a subclass** (uses `is_a?`). | `Dog.new` → ✅ `be_kind_of(Animal)` |
# | **`respond_to`**        | Object must respond to a method (duck typing). Doesn’t care about class.                    | `"hello"` → ✅ `respond_to(:length)` |
