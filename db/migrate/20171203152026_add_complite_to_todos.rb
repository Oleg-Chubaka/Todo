class AddCompliteToTodos < ActiveRecord::Migration[5.1]
  def change
    add_column :todos, :complite, :boolean, null: false, default: false
  end
end
