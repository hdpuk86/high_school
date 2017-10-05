require('pry-byebug')
require_relative('../models/student')
require_relative('../models/subject')
require_relative('../models/student_subject')

Student_subject.delete_all()
Student.delete_all()
Subject.delete_all()


student1 = Student.new({
  'name' => 'Hayley'
  })
student1.save()

student2 = Student.new({
  'name' => 'Matt'
  })
student2.save()

student3 = Student.new({
  'name' => 'Joe'
  })
student3.save()

subject1 = Subject.new({
  'name' => 'maths',
  'teacher' => 'Mr Cole'
  })
subject1.save()

subject2 = Subject.new({
  'name' => 'history',
  'teacher' => 'Mrs Small'
  })
subject2.save()

student_subject1 = Student_subject.new({
  'student_id' => student1.id,
  'subject_id' => subject1.id
  })
student_subject1.save()

student_subject2 = Student_subject.new({
  'student_id' => student1.id,
  'subject_id' => subject2.id
  })
student_subject2.save()

student_subject3 = Student_subject.new({
  'student_id' => student2.id,
  'subject_id' => subject1.id
  })
student_subject3.save()

student_subject4 = Student_subject.new({
  'student_id' => student3.id,
  'subject_id' => subject2.id
  })
student_subject4.save()


binding.pry
nil
