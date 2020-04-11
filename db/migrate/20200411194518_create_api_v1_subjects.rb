class CreateApiV1Subjects < ActiveRecord::Migration[6.0]
  def change
    create_table :api_v1_subjects do |t|
      t.string :categories
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
