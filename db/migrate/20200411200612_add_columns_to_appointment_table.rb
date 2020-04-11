class AddColumnsToAppointmentTable < ActiveRecord::Migration[6.0]
  def change
    add_column :api_v1_appointments, :rating, :integer
    add_column :api_v1_appointments, :comments, :text
  end
end
