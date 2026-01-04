class ChangeUsersColumnsToNotNull < ActiveRecord::Migration[7.1]
  def up
    #既存のNULLレコードに対し仮のuser_nameを設定
    execute <<-SQL
     UPDATE users
     SET user_name = 'user_' || id
     WHERE user_name IS NULL;
    SQL


    #カラムをnot nullに設定
    change_column_null :users, :name, false
    change_column_null :users, :email, false
    change_column_null :users, :user_name, false
  end
end

def down

   #ロールバック時の処理(railsでは変更がなかった時の処理を同時に記録する必要があるため)
  change_column_null :users, :name,true
  change_column_null :users, :email, true
  change_column_null :users, :user_name, true
end

