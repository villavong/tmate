class AddAmountToScholarships < ActiveRecord::Migration[5.0]
  def change
    add_column :scholarships, :amount, :string
  end
end
