require '../lib/teacher'

EASY = ["FVS", "Music", "II", "IT", "ChKR"]
MEDIUM = ["Biology", "Physics", "Chemistry", "History", "Geography", "Psycology"]

class Subject
  attr_accessor :name, :teacher, :prefered_hours

  def initialize(name, teacher)
    @name = name
    @teacher = teacher
    @prefered_hours = if EASY.index(name)
                        [6, 5]
                      elsif MEDIUM.index(name)
                        [1, 5, 7, 6]
                      else
                        [2, 3, 4, 5]
                      end
  end
end