GRADE_AVAILABLE = [["Monday", 6], ["Monday", 7], ["Tuesday", 6], ["Tuesday", 7], ["Wednesday", 1], ["Wednesday", 2], ["Wednesday", 3], ["Wednesday", 4], ["Wednesday", 5], ["Wednesday", 6], ["Wednesday", 7], ["Thursday", 1], ["Thursday", 2], ["Thursday", 3], ["Thursday", 4], ["Thursday", 5], ["Thursday", 6], ["Thursday", 7], ["Friday", 1], ["Friday", 2], ["Friday", 3], ["Friday", 4], ["Friday", 5], ["Friday", 6], ["Friday", 7]]

class GradeTest < MiniTest::Unit::TestCase
  def test_creating_grade
    t = Teacher.new("Boryana Parusheva", "Mathematics")
    subject = Subject.new("Mathematics", t)
    grade = Grade.new("9a", [subject])

    assert_equal [subject], grade.subjects
    assert_equal "9a", grade.name
  end

  def test_adding_class_to_grade_program
    teacher = Teacher.new("Boryana Parusheva", "Mathematics")
    subject = Subject.new("Mathematics", teacher)
    grade = Grade.new("9a", [subject])
    grade.add_class_to_program("Monday", 4, teacher)
    result = {["Monday", 4] => teacher}

    assert_equal result, grade.program
  end

  def test_if_is_available
    teacher = Teacher.new("Boryana Parusheva", "Mathematics")
    subject = Subject.new("Mathematics", teacher)
    grade = Grade.new("9a", [subject])
    grade.add_class_to_program("Monday", 4, teacher)

    refute grade.available("Monday", 4)
    assert grade.available("Monday", 5)
  end

  def test_removing_class_to_teachers_program
    teacher = Teacher.new("Boryana Parusheva", "Mathematics")
    subject = Subject.new("Mathematics", teacher)
    grade = Grade.new("9a", [subject])
    grade.add_class_to_program("Monday", 4, teacher)
    grade.remove_class_from_program("Monday", 4)

    assert_equal Hash.new, teacher.program
  end

  def test_available_hours
    teacher = Teacher.new("Boryana Parusheva", "Mathematics")
    subject = Subject.new("Mathematics", teacher)
    grade = Grade.new("9a", [subject])
    grade.add_class_to_program("Monday", 1, teacher)
    grade.add_class_to_program("Monday", 2, teacher)
    grade.add_class_to_program("Monday", 3, teacher)
    grade.add_class_to_program("Monday", 4, teacher)
    grade.add_class_to_program("Monday", 5, teacher)
    grade.add_class_to_program("Tuesday", 1, teacher)
    grade.add_class_to_program("Tuesday", 2, teacher)
    grade.add_class_to_program("Tuesday", 3, teacher)
    grade.add_class_to_program("Tuesday", 4, teacher)
    grade.add_class_to_program("Tuesday", 5, teacher)

    assert_equal GRADE_AVAILABLE, grade.available_hours
  end
end