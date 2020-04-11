class Api::V1::User < ApplicationRecord
  has_secure_password

  has_many :appointments, foreign_key: :student_id, dependent: :destroy
  has_many :tutors, through: :appointments, dependent: :destroy 
  has_many :student_appointments, foreign_key: :tutor_id, dependent: :destroy 
  has_many :students, through: :student_appointments, dependent: :destroy

end
