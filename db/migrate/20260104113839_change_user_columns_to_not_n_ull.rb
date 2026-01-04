class ChangeUserColumnsToNotNUll < ActiveRecord::Migration[7.1]
  def up
    change_column_null :users, :password_digest, false
  end


  def down
    change_column_null :users, :password_digest, true
  end
end
