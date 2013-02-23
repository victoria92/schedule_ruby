require '../lib/school'
require 'minitest/unit'

class SchoolTest < MiniTest::Unit::TestCase
  def test_creating_school
    teacher = Teacher.new("Boryana Parusheva", "Mathematics")
    subject = Subject.new("Mathematics", teacher)
    grade = Grade.new("9a", [subject, subject])
    school = School.new([teacher], [grade])

    assert_equal [teacher], school.teachers
    assert_equal [grade], school.grades
    assert_equal Hash.new, school.program.program
    result = [[grade, subject], [grade, subject]]
    assert_equal result, school.all_school_classes
  end

  def test_mutual_available_hours
    teacher = Teacher.new("Boryana Parusheva", "Mathematics")
    subject = Subject.new("Mathematics", teacher)
    grade = Grade.new("9a", [subject])
    school = School.new([teacher], [grade])

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
    teacher.add_class_to_program("Monday", 6, "9a")

    result = [["Monday", 7], ["Tuesday", 6], ["Tuesday", 7], ["Wednesday", 1],
              ["Wednesday", 2], ["Wednesday", 3], ["Wednesday", 4], ["Wednesday", 5],
              ["Wednesday", 6], ["Wednesday", 7], ["Thursday", 1], ["Thursday", 2],
              ["Thursday", 3], ["Thursday", 4], ["Thursday", 5], ["Thursday", 6],
              ["Thursday", 7], ["Friday", 1], ["Friday", 2], ["Friday", 3],
              ["Friday", 4], ["Friday", 5], ["Friday", 6], ["Friday", 7]
              ]

    assert_equal  result, school.mutual_available_hours(teacher, grade)
  end

  def test_finding_best_option
    teacher = Teacher.new("Dobromir Demirov", "FVS")
    subject = Subject.new("FVS", teacher)
    grade = Grade.new("9a", [subject])
    school = School.new([teacher], [grade])
    available_hours = [["Monday", 1], ["Monday", 7], ["Monday", 6]]

    assert_equal ["Monday", 6], school.find_best_option(subject, available_hours)
  end
end
