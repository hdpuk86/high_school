require_relative('../db/sql_runner')

class Student

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO students (name) VALUES ($1) RETURNING id;"
    values = [@name]
    result = SqlRunner.run(sql, "save_student", values)
    @id = result[0]['id'].to_i()
  end

  def self.delete_all()
    sql = "DELETE FROM students;"
    values = []
    SqlRunner.run(sql, "delete_all_student", values)
  end

  def self.all()
    sql = "SELECT * FROM students;"
    values = []
    results = SqlRunner.run(sql, "show_all_students", values)
    return results.map {|student| Student.new(student)}
  end

  def subjects()
    sql = "SELECT * FROM subjects
    INNER JOIN student_subjects ON student_subjects.subject_id = subjects.id
    WHERE student_id = $1;"
    values = [@id]
    subjects = SqlRunner.run(sql, "show_subjects_for_student", values)
    return subjects.map {|subject| Subject.new(subject)}
  end

end
