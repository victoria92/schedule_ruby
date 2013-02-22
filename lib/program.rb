require './classes'

class Program
  attr_accessor :program

  def initialize
    @program = {}
  end

  def add_class(new_class)
    program[[new_class.day, new_class.grade, new_class.hour]] = new_class.subject
    new_class.teacher.add_class_to_program(new_class.day, new_class.hour, new_class.grade)
    new_class.grade.add_class_to_program(new_class.day, new_class.hour, new_class.teacher)
    program
  end

  def remove_class(class_to_remove)
    program.delete [class_to_remove.day, class_to_remove.grade, class_to_remove.hour]
    class_to_remove.teacher.remove_class_from_program(class_to_remove.day, class_to_remove.hour)
    class_to_remove.grade.remove_class_from_program(class_to_remove.day, class_to_remove.hour)
    program
  end
end