class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string :title, null: false
      t.text :comment
      t.datetime :term
      t.timestamps null: false
    end
  end
end
