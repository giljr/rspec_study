# lib/printer.rb
class Printer
  def say_hello
    puts "Hello, world!"        # goes to STDOUT
  end

  def warn_user
    warn "Something went wrong" # goes to STDERR
  end
end
