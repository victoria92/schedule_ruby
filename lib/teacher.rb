DAYS = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]

class Teacher
  attr_accessor :name, :subject, :program

  def initialize(name, subject)
    @name = name
    @subject = subject
    @program = {}
  end

  def available(day, hour)
    program[[day, hour]] == nil ? true : false
  end

  def available_hours
    DAYS.map { |day| 1.upto(7).select { |hour| available(day, hour) }.map { |hour| [day, hour] } }.flatten(1)
  end

  def add_class_to_program(day, hour, grade)
    program[[day, hour]] = grade
  end

  def remove_class_from_program(day, hour)
    program.delete [day, hour]
  end

  def to_s
    "#{subject}\n"
  end

    def get_day_program(day)
    1.upto(7).reduce("") { |string, hour| string + "#{hour}. #{program[[day, hour]]}\n" }
  end

  def visualize_teacher_program
    DAYS.reduce("") { |string, day| string + get_day_program(day) }
  end
end
