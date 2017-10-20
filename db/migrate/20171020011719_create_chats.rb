class CreateChats < ActiveRecord::Migration[5.1]
  def change
    create_table :chats do |t|
      t.string :name
      t.string :category

      t.timestamps
    end
  end
end
