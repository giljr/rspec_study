# lib/user.rb
class User
  attr_reader :name, :age, :email

  def initialize(name:, age:, email:)
    @name  = name
    @age   = age
    @email = email
  end
end
