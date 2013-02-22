require 'sinatra'
require './school'

teachers = []
grades = []

get '/' do
  erb :menu
end

get '/teacher_form' do
  erb :teacher_form
end

post '/teacher_form' do
  teachers << Teacher.new(params[:name], params[:subject])
  redirect '/'
end

get '/grade_form' do
  erb :grade_form
end

post '/grade_form' do
  subjects = []
  1.upto(3).map do |n|
    subject_name = params[("subject" + n.to_s).to_sym]
    teacher_name = params[("teacher" + n.to_s).to_sym]
    teacher = teachers.select { |teacher| teacher.name = teacher_name }.first
    params[("horarium" + n.to_s).to_sym].to_i.times { subjects << Subject.new(subject_name, teacher) }
  end
  grades << Grade.new(params[:name], subjects)
  redirect '/'
end

get '/grades' do
  erb :grades, locals: { grades: grades }
end

get '/teachers' do
  erb :teachers, locals: { teachers: teachers }
end

get '/program' do
  school = School.new(teachers, grades)
  school.create_program
  erb :program, locals: { school: school }
end