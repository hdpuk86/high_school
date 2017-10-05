require_relative('../db/sql_runner')

class Subject

  attr_accessor :name, :teacher
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @teacher = options['teacher']
  end

  def save()
    sql = "INSERT INTO subjects (name, teacher) VALUES ($1, $2) RETURNING id;"
    values = [@name, @teacher]
    result = SqlRunner.run(sql, "save_subject", values)
    @id = result[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM subjects;"
    values = []
    SqlRunner.run(sql, "delete_all_subjects", values)
  end

  def self.all()
    sql = "SELECT * FROM subjects;"
    values = []
    results = SqlRunner.run(sql, "show_all_subjects", values)
    return results.map {|subject| Subject.new(subject)}
  end

  def students()
    sql = "SELECT students.* FROM students
    INNER JOIN student_subjects
    ON student_subjects.student_id = students.id
    WHERE subject_id = $1"
    values = [@id]
    students = SqlRunner.run(sql, "show_students_for_subject", values)
    return students.map {|student| Student.new(student)}
  end

end
