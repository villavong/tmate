class CreateEducations < ActiveRecord::Migration[5.0]
  def change
    create_table :educations do |t|
      t.string :education

      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
