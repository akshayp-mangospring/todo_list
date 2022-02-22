class CreateTodoItems < ActiveRecord::Migration[6.1]
  def change
    create_table :todo_items do |t|
      t.string  :content, null: false
      t.boolean :completed, default: false
      t.bigint  :todo_list_id

      t.timestamps
    end

    add_foreign_key :todo_items, :todo_lists
  end
end
