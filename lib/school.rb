require './program'

class School
  attr_accessor :teachers, :grades, :program, :all_school_classes

  def initialize(teachers, grades)
    @teachers = teachers
    @grades = grades
    #@programs ?
    @program = Program.new
    @all_school_classes = grades.map { |grade| grade.subjects.map { |subject| [grade, subject] } }.flatten(1)
  end

  def mutual_available_hours(teacher, grade)
    teacher.available_hours.select { |time| grade.available(time[0], time[1]) }
  end

  def find_best_option(subject, available_hours)
    best_options = available_hours.select { |option| subject.prefered_hours.index(option[1]) }
    # if best_options != []
    #   best_options = best_options.sort do |option1, option2|
    #     subject.prefered_hours.index(option1[1]) < subject.prefered_hours.index(option2[1])
    #   end
    # end
    best_options == [] ? available_hours.shift : best_options.shift
  end

  def create_program(order_of_adding_classes = [])
    return if all_school_classes == []

    current_class = all_school_classes.shift
    available_hours = mutual_available_hours(current_class[1].teacher, current_class[0])

    if available_hours == []
      removed_class = order_of_adding_classes.pop
      my_class = removed_class[0]
      available_hours = removed_class[1]
      program.remove_class(my_class)
      all_school_classes.unshift [my_class.grade, Subject.new(my_class.subject, my_class.teacher)]

    else
      chosen_hour = find_best_option(current_class[1], available_hours)
      my_class = Classes.parse(current_class, chosen_hour)
      program.add_class(my_class)
      order_of_adding_classes << [my_class, available_hours]
    end

    create_program(order_of_adding_classes)
  end
end

FVS = Teacher.new("Demirov", "FVS")
Music = Teacher.new("Petrova", "Music")
II = Teacher.new("Krysteva", "II")
IT = Teacher.new("Karadjova", "IT")
Biology = Teacher.new("Petkova", "Biology")
Physics = Teacher.new("Kostadinova", "Physics")
Psycology = Teacher.new("Dacheva", "Psycology")
History = Teacher.new("Petrova", "History")
Chemistry = Teacher.new("Hineva", "Chemistry")
Geography = Teacher.new("Dokimova", "Geography")
Maths = Teacher.new("Parusheva", "Maths")
BEL = Teacher.new("Trendafilova", "BEL")
AE = Teacher.new("Georgieva", "AE")
RE = Teacher.new("Todorova", "RE")
Informatics = Teacher.new("Trifonova", "Informatics")
teachers = [FVS, Music, II, IT, Biology, Physics, Psycology, History, Chemistry, Geography, Maths, BEL, AE, RE, Informatics]
a = Grade.new("9a", [Subject.new("FVS", FVS), Subject.new("FVS", FVS), Subject.new("Music", Music), Subject.new("II", II), Subject.new("IT", IT), Subject.new("Biology", Biology), Subject.new("Biology", Biology), Subject.new("Physics", Physics), Subject.new("Physics", Physics), Subject.new("Psycology", Psycology), Subject.new("Psycology", Psycology), Subject.new("History", History), Subject.new("Chemistry", Chemistry), Subject.new("Geography", Geography), Subject.new("Maths", Maths), Subject.new("Maths", Maths), Subject.new("Maths", Maths), Subject.new("Maths", Maths), Subject.new("Maths", Maths), Subject.new("Maths", Maths), Subject.new("Maths", Maths), Subject.new("Maths", Maths), Subject.new("BEL", BEL), Subject.new("BEL", BEL), Subject.new("BEL", BEL), Subject.new("AE", AE), Subject.new("AE", AE), Subject.new("AE", AE), Subject.new("AE", AE), Subject.new("RE", RE), Subject.new("RE", RE), Subject.new("Informatics", Informatics)])
b = Grade.new("9b", [Subject.new("FVS", FVS), Subject.new("FVS", FVS), Subject.new("Music", Music), Subject.new("II", II), Subject.new("IT", IT), Subject.new("Biology", Biology), Subject.new("Biology", Biology), Subject.new("Physics", Physics), Subject.new("Physics", Physics), Subject.new("Psycology", Psycology), Subject.new("Psycology", Psycology), Subject.new("History", History), Subject.new("Chemistry", Chemistry), Subject.new("Geography", Geography), Subject.new("Maths", Maths), Subject.new("Maths", Maths), Subject.new("Maths", Maths), Subject.new("Maths", Maths), Subject.new("Maths", Maths), Subject.new("Maths", Maths), Subject.new("Maths", Maths), Subject.new("Maths", Maths), Subject.new("BEL", BEL), Subject.new("BEL", BEL), Subject.new("BEL", BEL), Subject.new("AE", AE), Subject.new("AE", AE), Subject.new("AE", AE), Subject.new("AE", AE), Subject.new("RE", RE), Subject.new("RE", RE), Subject.new("Informatics", Informatics)])
c = Grade.new("9v", [Subject.new("FVS", FVS), Subject.new("FVS", FVS), Subject.new("Music", Music), Subject.new("II", II), Subject.new("IT", IT), Subject.new("Biology", Biology), Subject.new("Biology", Biology), Subject.new("Physics", Physics), Subject.new("Physics", Physics), Subject.new("Psycology", Psycology), Subject.new("Psycology", Psycology), Subject.new("History", History), Subject.new("Chemistry", Chemistry), Subject.new("Geography", Geography), Subject.new("Maths", Maths), Subject.new("Maths", Maths), Subject.new("Maths", Maths), Subject.new("Maths", Maths), Subject.new("Maths", Maths), Subject.new("Maths", Maths), Subject.new("Maths", Maths), Subject.new("Maths", Maths), Subject.new("BEL", BEL), Subject.new("BEL", BEL), Subject.new("BEL", BEL), Subject.new("AE", AE), Subject.new("AE", AE), Subject.new("AE", AE), Subject.new("AE", AE), Subject.new("RE", RE), Subject.new("RE", RE), Subject.new("Informatics", Informatics)])
d = Grade.new("9g", [Subject.new("FVS", FVS), Subject.new("FVS", FVS), Subject.new("Music", Music), Subject.new("II", II), Subject.new("IT", IT), Subject.new("Biology", Biology), Subject.new("Biology", Biology), Subject.new("Physics", Physics), Subject.new("Physics", Physics), Subject.new("Psycology", Psycology), Subject.new("Psycology", Psycology), Subject.new("History", History), Subject.new("Chemistry", Chemistry), Subject.new("Geography", Geography), Subject.new("Maths", Maths), Subject.new("Maths", Maths), Subject.new("Maths", Maths), Subject.new("Maths", Maths), Subject.new("Maths", Maths), Subject.new("Maths", Maths), Subject.new("Maths", Maths), Subject.new("Maths", Maths), Subject.new("BEL", BEL), Subject.new("BEL", BEL), Subject.new("BEL", BEL), Subject.new("AE", AE), Subject.new("AE", AE), Subject.new("AE", AE), Subject.new("AE", AE), Subject.new("RE", RE), Subject.new("RE", RE), Subject.new("Informatics", Informatics)])
e = Grade.new("9d", [Subject.new("FVS", FVS), Subject.new("FVS", FVS), Subject.new("Music", Music), Subject.new("II", II), Subject.new("IT", IT), Subject.new("Biology", Biology), Subject.new("Biology", Biology), Subject.new("Physics", Physics), Subject.new("Physics", Physics), Subject.new("Psycology", Psycology), Subject.new("Psycology", Psycology), Subject.new("History", History), Subject.new("Chemistry", Chemistry), Subject.new("Geography", Geography), Subject.new("Maths", Maths), Subject.new("Maths", Maths), Subject.new("Maths", Maths), Subject.new("Maths", Maths), Subject.new("Maths", Maths), Subject.new("Maths", Maths), Subject.new("Maths", Maths), Subject.new("Maths", Maths), Subject.new("BEL", BEL), Subject.new("BEL", BEL), Subject.new("BEL", BEL), Subject.new("AE", AE), Subject.new("AE", AE), Subject.new("AE", AE), Subject.new("AE", AE), Subject.new("RE", RE), Subject.new("RE", RE), Subject.new("Informatics", Informatics)])

MG = School.new(teachers, [a, b, c, d, e])
MG.create_program
print MG.program