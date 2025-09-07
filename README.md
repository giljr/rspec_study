# RSpec Study

Welcome to **RSpec Study**, a collection of Ruby and Rails projects focused on learning and practicing **Test-Driven Development (TDD)** with **RSpec** and **Capybara**.  

This repository is organized into two main directories:

- **pure_ruby** – Exercises and examples using plain Ruby and RSpec.
- **rails_test_app** – A Rails 7 application for practicing RSpec model, controller, and view tests.

---

## Repository Structure
```
bdd/
├── pure_ruby/ # Ruby exercises with RSpec
├── rails_test_app/ # Rails 7 app with scaffolded Customer model and tests
└── README.md # Index / overview of the repository
```

---

## pure_ruby

Contains Ruby scripts and RSpec tests for:

- Core Ruby exercises
- Custom RSpec matchers
- Testing classes, methods, and objects
- Predicates like `be_nil`, `be_zero`, `be_empty`
- Exception handling tests
- Transient attributes examples

Run tests:

```bash
cd pure_ruby
rspec
```
rails_test_app

A Rails 7 application demonstrating:

    Scaffolded Customer model with controller and transient attributes

    RSpec model, controller, and request specs

    Capybara for view tests

    Test-Driven Development (TDD) workflows

Run tests:
```
cd rails_test_app
bundle install
rails db:create db:migrate
rspec spec
```
Course Summary

This repository is inspired by "Testing Ruby with RSpec" and TDD with Rails:

    Learn Test-Driven Development (TDD) in Ruby

    Hands-on practice with RSpec, Capybara, FactoryBot, and VCR

    Test models, controllers, views, and APIs

    Build confidence to refactor code safely

Who this is for:

    Ruby developers

    Rails developers

    Programmers wanting to improve testing skills

Acknowledgements

    TDD com Ruby on Rails, RSpec e Capybara

Testing Ruby with RSpec: The Complete Guide
Author

Gilberto Jr (J3) – Full Stack Developer & RSpec Enthusiast
Medium Webpage

## Acknowledgements

 - [TDD com Ruby on Rails, RSpec e Capybara](https://www.udemy.com/course/rails-tdd/)  - Desenvolva aplicações guiada a testes com Ruby on Rails by Jackson Pires

 - [Testing Ruby with RSpec: The Complete Guide](https://www.udemy.com/course/testing-ruby-with-rspec/) - Master the art of test driven development (TDD) in Ruby using the RSpec Gem. No previous testing experience needed! by Boris Paskhaver

## Author

Gilberto Jr (J3) – Full Stack Developer & RSpec Enthusiast
[Medium Webpage](https://medium.com/jungletronics)


