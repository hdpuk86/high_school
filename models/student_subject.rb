require_relative('../db/sql_runner')
require_relative('./student')
require_relative('./subject')

class Student_subject

  attr_accessor :student_id, :subject_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
    @student_id = options['student_id'].to_i
    @subject_id = options['subject_id'].to_i
  end

  def save()
    sql = "INSERT INTO student_subjects (student_id, subject_id) VALUES ($1, $2) RETURNING id;"
    values = [@student_id, @subject_id]
    result = SqlRunner.run(sql, "save_student_subject", values)
    @id = result[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM student_subjects;"
    values = []
    SqlRunner.run(sql, "delete_all_student_subjects", values)
  end

  def self.all()
    sql = "SELECT * FROM student_subjects;"
    values = []
    results = SqlRunner.run(sql, "show_all_student_subjects", values)
    return results.map {|result| Student_subject.new(result)}
  end

  def student()
    sql = "SELECT * FROM students WHERE id = $1;"
    values = [@student_id]
    student = SqlRunner.run(sql, "show_student", values).first
    return Student.new(student)
  end

  def subject()
    sql = "SELECT * FROM subjects WHERE id = $1;"
    values = [@subject_id]
    subject = SqlRunner.run(sql, "show_subject", values).first
    return Subject.new(subject)
  end

end
