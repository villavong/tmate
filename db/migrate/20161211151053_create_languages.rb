class CreateLanguages < ActiveRecord::Migration[5.0]
  def change
    create_table :languages do |t|
      t.string :name
      t.string :language
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
