class CommentsBodyNotnull < ActiveRecord::Migration[7.1]
  #あとから下書きできるようにするためbody(コメント内容)は空オッケーにしようとしたがやっぱりやめた
  def up
    change_column_null :comments, :body ,false
  end

  def down
    change_column_null :comments, :body ,true 
  end


end

