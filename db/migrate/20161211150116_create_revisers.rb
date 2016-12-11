class CreateRevisers < ActiveRecord::Migration[5.0]
  def change
    create_table :revisers do |t|
      t.references :user, index: true, foreign_key: true
      t.text :description
      t.integer :max_pages
      t.integer :price_per
      t.boolean :active
      t.string :essay_type
      t.string :average_time
      t.timestamps
    end
  end
end
