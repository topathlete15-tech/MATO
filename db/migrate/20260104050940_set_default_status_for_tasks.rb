class SetDefaultStatusForTasks < ActiveRecord::Migration[7.1]
    def up
      # ステップ1: 既存のNULLレコードをpending（0）に更新
      execute <<-SQL
        UPDATE tasks SET status = 0 WHERE status IS NULL;
      SQL
      
      # ステップ2: デフォルト値を設定
      change_column_default :tasks, :status, 0
      
      # ステップ3: null: false制約を追加
      change_column_null :tasks, :status, false
    end
  
    def down
      # ロールバック時の処理
      change_column_null :tasks, :status, true
      change_column_default :tasks, :status, nil
    end
end
