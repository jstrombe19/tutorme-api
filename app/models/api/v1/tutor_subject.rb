class Api::V1::TutorSubject < ApplicationRecord

  belongs_to :tutor, class_name: "User"
  belongs_to :subject
  
end
