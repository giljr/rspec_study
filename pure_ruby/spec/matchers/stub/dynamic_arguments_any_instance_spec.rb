# frozen_string_literal: true

require 'student'
require 'course'

RSpec.describe 'Stubar' do
  it '#has_finished? with dynamic argument' do
    student = Student.new

    # Stub has_finished? to accept any Course instance dynamically
    allow(student).to receive(:has_finished?) do |c|
      c.name == 'Math' # example dynamic logic based on argument
    end

    math_course = Course.new
    math_course.name = 'Math'
    history_course = Course.new
    history_course.name = 'History'

    expect(student.has_finished?(math_course)).to be true
    expect(student.has_finished?(history_course)).to be false
  end

  it '#foo with dynamic argument' do
    obj = double('Obj')

    # Stub foo to return a value based on the argument dynamically
    allow(obj).to receive(:foo) do |arg|
      "Hello #{arg}" # dynamically returns greeting with argument
    end

    expect(obj.foo('World')).to eq('Hello World')
    expect(obj.foo('RSpec')).to eq('Hello RSpec')
  end

  it 'Any instance stub with dynamic argument' do
    course_math = Course.new
    course_math.name = 'Math'

    course_history = Course.new
    course_history.name = 'History'

    student1 = Student.new
    student2 = Student.new

    # Stub has_finished? for any instance of Student dynamically
    allow_any_instance_of(Student).to receive(:has_finished?) do |instance, course|
      raise "Not a Student instance" unless instance.is_a?(Student)
      course.name == 'Math' # dynamic return value
    end

    # Test the behavior
    expect(student1.has_finished?(course_math)).to be true
    expect(student2.has_finished?(course_history)).to be false
  end

  it 'Forcing raise error in dynamic stub' do
    student = Student.new

    # Stub has_finished? to raise an error based on argument dynamically
    allow(student).to receive(:has_finished?) do |course|
      raise 'Invalid course' if course.name == 'Invalid'
      true
    end

    valid_course = Course.new
    valid_course.name = 'Valid'
    invalid_course = Course.new
    invalid_course.name = 'Invalid'

    expect(student.has_finished?(valid_course)).to be true
    expect { student.has_finished?(invalid_course) }.to raise_error('Invalid course')
  end
end
