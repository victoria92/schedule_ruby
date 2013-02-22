DAYS = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]

class Teacher
  attr_accessor :name, :subject, :program

  def initialize(name, subject)
    @name = name
    @subject = subject #only name!!! Maybe ID?
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
    "#{subject}\n"     #nqkakvo podravnpvane?
  end
end