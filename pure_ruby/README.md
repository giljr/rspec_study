# Pure Ruby RSpec Study

This folder contains pure Ruby projects designed to practice **RSpec testing** and Ruby fundamentals.

## Overview

You will find examples that cover:

- Testing Ruby classes and methods.
- Using **transient attributes** in models (attributes in memory, not persisted to database).
- RSpec matchers like `be_nil`, `be_zero`, `be_empty`, and `raise_exception`.
- Shared examples, custom matchers, and advanced test patterns.
- Handling dynamic and random attributes for consistent testing.

## Running Tests

Make sure you have **RSpec installed**:

```bash
gem install rspec
```
Run all tests:
```bash
rspec spec/
```
Run a specific test file:
```bash
rspec spec/models/transient_attrs_spec.rb
```
## Highlights

Demonstrates best practices for testing in pure Ruby.

Focus on robust, repeatable tests using dynamic values like SecureRandom.

Includes debugging outputs for better understanding test behavior.

Provides examples of pending tests, warnings, and proper assertions.



## Acknowledgements

 - [TDD com Ruby on Rails, RSpec e Capybara](https://www.udemy.com/course/rails-tdd/)  - Desenvolva aplicações guiada a testes com Ruby on Rails by Jackson Pires

 - [Testing Ruby with RSpec: The Complete Guide](https://www.udemy.com/course/testing-ruby-with-rspec/) - Master the art of test driven development (TDD) in Ruby using the RSpec Gem. No previous testing experience needed! by Boris Paskhaver

## Author

Gilberto Jr (J3) – Full Stack Developer & RSpec Enthusiast
[Medium Webpage](https://medium.com/jungletronics)


