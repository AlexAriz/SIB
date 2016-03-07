class RemoveUniversityNameFromSelectionProcesses < ActiveRecord::Migration
  def change
    remove_column :selection_processes, :university_name, :string
  end
end
