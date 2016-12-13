class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.string :work
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
