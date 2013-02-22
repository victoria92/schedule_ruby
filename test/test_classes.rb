require '../lib/classes'
require 'minitest/unit'

class ClassesTest < MiniTest::Unit::TestCase
  def test_creating_classes
    t = Teacher.new("Boryana Parusheva", "Mathematics")
    subject = Subject.new("Mathematics", t)
    grade = Grade.new("9a", [subject])
    test_class = Classes.new(grade, "Mathematics", t, "Monday", 4)

    assert_equal grade, test_class.grade
    assert_equal "Mathematics", test_class.subject
    assert_equal t, test_class.teacher
    assert_equal "Monday", test_class.day
    assert_equal 4, test_class.hour
  end

  def test_parsing_classes
    t = Teacher.new("Boryana Parusheva", "Mathematics")
    subject = Subject.new("Mathematics", t)
    grade = Grade.new("9a", [subject])
    test_class = Classes.parse([grade, subject], ["Monday", 4])

    assert_equal grade, test_class.grade
    assert_equal "Mathematics", test_class.subject
    assert_equal t, test_class.teacher
    assert_equal "Monday", test_class.day
    assert_equal 4, test_class.hour
  end
end