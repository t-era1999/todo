class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string  :title, null:false
      t.string  :content, null:false
      t.date    :deadline_on
      t.integer :importance
      t.integer :category_id
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
