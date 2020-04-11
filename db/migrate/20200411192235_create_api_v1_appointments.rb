class CreateApiV1Appointments < ActiveRecord::Migration[6.0]
  def change
    create_table :api_v1_appointments do |t|
      t.date :date, null: false
      t.time :time, null: false
      t.string :communication_medium, null: false
      t.integer :appointment_duration, null: false
      t.integer :student_id, null: false, foreign_key: true
      t.integer :tutor_id, null: false, foreign_key: true 

      t.timestamps
    end

    add_foreign_key :api_v1_appointments, :api_v1_users, column: :student_id
    add_foreign_key :api_v1_appointments, :api_v1_users, column: :tutor_id
  end
end
