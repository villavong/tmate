class CreateViewcounts < ActiveRecord::Migration[5.0]
  def change
    create_table :viewcounts do |t|
      t.string :ip_address

      t.timestamps
    end
  end
end
