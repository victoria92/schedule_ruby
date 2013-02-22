require '../lib/teacher'
require 'minitest/unit'

TEST_AVAILABLES = [["Monday", 6], ["Monday", 7], ["Tuesday", 6], ["Tuesday", 7], ["Wednesday", 1], ["Wednesday", 2], ["Wednesday", 3], ["Wednesday", 4], ["Wednesday", 5], ["Wednesday", 6], ["Wednesday", 7], ["Thursday", 1], ["Thursday", 2], ["Thursday", 3], ["Thursday", 4], ["Thursday", 5], ["Thursday", 6], ["Thursday", 7], ["Friday", 1], ["Friday", 2], ["Friday", 3], ["Friday", 4], ["Friday", 5], ["Friday", 6], ["Friday", 7]]

class TeacherTest < MiniTest::Unit::TestCase
  def test_creating_teacher
    assert_equal "Boryana Parusheva", Teacher.new("Boryana Parusheva", "Mathematics").name
    assert_equal "Mathematics", Teacher.new("Boryana Parusheva", "Mathematics").subject
  end

  def test_adding_class_to_teachers_program
    teacher = Teacher.new("Boryana Parusheva", "Mathematics")
    teacher.add_class_to_program("Monday", 4, "9a")
    result = {["Monday", 4] => "9a"}

    assert_equal result, teacher.program
  end

  def test_if_is_available
    teacher = Teacher.new("Boryana Parusheva", "Mathematics")
    teacher.add_class_to_program("Monday", 4, "9a")

    refute teacher.available("Monday", 4)
    assert teacher.available("Monday", 5)
  end

  def test_removing_class_to_teachers_program
    teacher = Teacher.new("Boryana Parusheva", "Mathematics")
    teacher.add_class_to_program("Monday", 4, "9a")
    teacher.remove_class_from_program("Monday", 4)

    assert_equal Hash.new, teacher.program
  end

  def test_available_hours
    teacher = Teacher.new("Boryana Parusheva", "Mathematics")
    teacher.add_class_to_program("Monday", 1, "9a")
    teacher.add_class_to_program("Monday", 2, "9a")
    teacher.add_class_to_program("Monday", 3, "10a")
    teacher.add_class_to_program("Monday", 4, "10a")
    teacher.add_class_to_program("Monday", 5, "11a")
    teacher.add_class_to_program("Tuesday", 1, "9a")
    teacher.add_class_to_program("Tuesday", 2, "9a")
    teacher.add_class_to_program("Tuesday", 3, "10a")
    teacher.add_class_to_program("Tuesday", 4, "10a")
    teacher.add_class_to_program("Tuesday", 5, "11a")

    assert_equal TEST_AVAILABLES, teacher.available_hours
  end
end