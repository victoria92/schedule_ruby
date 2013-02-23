require '../lib/program'
require 'minitest/unit'

class ProgramTest < MiniTest::Unit::TestCase
  def test_creating_empty_program
    test_program = Program.new

    assert_equal Hash.new, test_program.program
  end

  def test_adding_class_to_program
    test_program = Program.new
    t = Teacher.new("Boryana Parusheva", "Mathematics")
    subject = Subject.new("Mathematics", t)
    grade = Grade.new("9a", [subject])
    test_class = Classes.parse([grade, subject], ["Monday", 4])
    test_program.add_class(test_class)
    result = {["Monday", grade, 4]=>"Mathematics"}

    assert_equal result, test_program.program
  end

  def test_removing_class_from_program
    test_program = Program.new
    t = Teacher.new("Boryana Parusheva", "Mathematics")
    subject = Subject.new("Mathematics", t)
    grade = Grade.new("9a", [subject])
    test_class = Classes.parse([grade, subject], ["Monday", 4])
    test_program.add_class(test_class)
    test_program.remove_class(test_class)

    assert_equal Hash.new, test_program.program
  end
end
