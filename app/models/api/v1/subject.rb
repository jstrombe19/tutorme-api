class Api::V1::Subject < ApplicationRecord

  has_many :tutor_subjects, dependent: :destroy
  has_many :tutors, through: :tutor_subjects, class_name: "User"

end
