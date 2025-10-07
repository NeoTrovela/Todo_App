class AddDoneToTodo < ActiveRecord::Migration[7.2]
  def change
    add_column :todos, :done, :boolean
  end
end
