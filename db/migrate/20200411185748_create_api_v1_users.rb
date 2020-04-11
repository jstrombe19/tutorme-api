class CreateApiV1Users < ActiveRecord::Migration[6.0]
  def change
    create_table :api_v1_users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.integer :phone
      t.string :password_digest
      t.boolean :tutor
      
      t.timestamps
    end
  end
end
