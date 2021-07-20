class ChangeChat < ActiveRecord::Migration[5.2]
  def change
    rename_column :chats, :sentence, :message
  end
end
