require 'printer'

RSpec.describe Printer do
  let(:printer) { Printer.new }

  context "stdout examples" do
    it "prints hello to stdout" do
      expect { printer.say_hello }
        .to output("Hello, world!\n").to_stdout
    end

    it "matches using regex" do
      expect { printer.say_hello }
        .to output(/Hello/).to_stdout
    end
  end

  context "stderr examples" do
    it "prints warning to stderr" do
      expect { printer.warn_user }
        .to output("Something went wrong\n").to_stderr
    end

    it "matches stderr with regex" do
      expect { printer.warn_user }
        .to output(/wrong/).to_stderr
    end
  end
end

# stout -> standard output (console)
# sterr -> standard error (console for errors)
# stdin -> standard input (keyboard)