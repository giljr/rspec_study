require 'student'
require 'course'

RSpec.describe 'Stubar' do
  it '#has_finished?' do
    student = Student.new
    course = Course.new

    allow(student).to receive(:has_finished?).with(an_instance_of(Course)).and_return(true)

    course_finished = student.has_finished?(course)

    expect(course_finished).to be true
    # expect(course_finished).to be_truthy
  end
end

# allow(...).to receive(...).and_return(...)           → stubs a method (without expectation).
# allow(...).to receive(...).with(...).and_return(...) → stubs a method (without expectation).
#                                  ^ (.an_instance_of(Class))
# expect(...).to receive(...)                          → sets an expectation that the method must be called.
