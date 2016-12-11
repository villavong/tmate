class AddBoardidToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :board, foreign_key: true
  end
end
