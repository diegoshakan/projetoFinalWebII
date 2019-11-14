class AddDoneToTarefas < ActiveRecord::Migration[5.2]
  def change
    add_column :tarefas, :is_done, :boolean, default: false
  end
end
