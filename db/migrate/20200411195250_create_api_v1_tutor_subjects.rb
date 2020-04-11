class CreateApiV1TutorSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :api_v1_tutor_subjects do |t|
      t.integer :tutor_id, null: false, foreign_key: true 
      t.references :api_v1_subject, null: false, foreign_key: true

      t.timestamps
    end

    add_foreign_key :api_v1_tutor_subjects, :api_v1_users, column: :tutor_id
  end
end
