class AddInfoToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :content, :string
  end
end
