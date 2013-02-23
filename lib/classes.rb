require '../lib/grade'

class Classes
  attr_accessor :grade, :subject, :teacher, :day, :hour

  def initialize(grade, subject, teacher, day, hour)
    @grade = grade
    @subject = subject
    @teacher = teacher
    @day = day
    @hour = hour
  end

  def Classes.parse(grade_subject, day_hour)
    Classes.new(grade_subject[0], grade_subject[1].name, grade_subject[1].teacher, day_hour[0], day_hour[1])
  end
end
