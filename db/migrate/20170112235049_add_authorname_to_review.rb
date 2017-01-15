class AddAuthornameToReview < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :author_name, :string
  end
end
