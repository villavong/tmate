class AddPaypalToReviser < ActiveRecord::Migration[5.0]
  def change
    add_column :revisers, :paypal, :string
  end
end
