require './subject'

class Grade
  attr_accessor :name, :subjects, :program

  def initialize(name, subjects)
    @name = name
    @subjects = subjects
    @program = {}
  end

  def available(day, hour)
    program[[day, hour]] == nil ? true : false
  end

  def available_hours
    DAYS.map { |day| 1.upto(7).select { |hour| available(day, hour) }.map { |hour| [day, hour] } }.flatten(1)
  end

  def add_class_to_program(day, hour, teacher)
    program[[day, hour]] = teacher
  end

  def remove_class_from_program(day, hour)
    program.delete [day, hour]
  end

  def get_day_program(day)
    1.upto(7).reduce("") { |string, hour| string + "#{hour}. #{program[[day, hour]]}\n" }
  end

  def visualize_grade_program
    DAYS.reduce("") { |string, day| string + get_day_program(day) }
  end
end