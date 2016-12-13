class AddUserRefToVerification < ActiveRecord::Migration[5.0]
  def change
    add_reference :verifications, :user, foreign_key: true
  end
end
