class SubjectTest < MiniTest::Unit::TestCase
  def test_creating_subject
    t = Teacher.new("Dobromir Demirov", "FVS")
    subject = Subject.new("FVS", t)

    assert_equal "FVS", subject.name
    assert_equal t, subject.teacher
    assert_equal [6, 5], subject.prefered_hours
  end
end