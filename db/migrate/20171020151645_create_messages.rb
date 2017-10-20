class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.integer :chat_id
      t.integer :user_id
      t.text :message_text

      t.timestamps
    end
  end
end
