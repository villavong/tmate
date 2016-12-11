class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.references :user, index: true, foreign_key: true
      t.references :reviser, index: true, foreign_key: true
      t.text :document
      t.text :rubric
      t.date :due_date
      t.integer :pages
      t.integer :price
      t.integer :total
      t.boolean :status
      t.timestamps
    end
  end
end
