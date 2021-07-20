class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.integer :user_ip, null: false #ユーザー側
      t.references :user #admin側
      t.string :sentence, null: false
      t.string :sender, null: false
      t.references :spot, null:
      t.timestamps
    end
  end
end
