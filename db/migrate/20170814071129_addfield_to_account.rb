class AddfieldToAccount < ActiveRecord::Migration[5.1]
 def up
    add_attachment :accounts, :upload_by_paperclip
  end

  def down
    remove_attachment :accounts, :upload_by_paperclip
  end
end
