require 'date'

class Course
  attr_accessor :name, :start_date, :end_date
  def initialize(name, start_date, end_date)
    @name = name
    @start_date = Date.parse(start_date)
    @end_date = Date.parse(end_date)
  end

  def previous_courses(date)
    raise ArgumentError.new('date  >= 2018-01-01') if date >= Date.parse('2018-01-01')
    @name if @start_date < date
  end

  def subsequent_course(date)
    raise ArgumentError.new('date  >= 2018-01-01') if date >= Date.parse('2018-01-01')
    @name if @end_date > date
  end

end

courses = []
file = File.open('cursos.txt', 'r')
file.readlines.each { |line| courses << Course.new(*line.split(', '))}
file.close

def show_starts_before(courses, date=Date.today)
    puts "--> Cursos comienzan previo a la fecha entregada <---"
  courses.each do |course|
    puts course.previous_courses(date)
  end
  puts "--> Cursos finalizan posterior a la fecha entregada <---"
  courses.each do |course|
    puts course.subsequent_course(date)
  end
end

show_starts_before(courses, Date.new(2017, 7, 9))
