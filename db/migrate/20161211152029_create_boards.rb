class CreateBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :boards do |t|
      t.string :title
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
