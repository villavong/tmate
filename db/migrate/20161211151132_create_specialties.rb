class CreateSpecialties < ActiveRecord::Migration[5.0]
  def change
    create_table :specialties do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true    
      t.string :specialty
      t.timestamps
    end
  end
end
