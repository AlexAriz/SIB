class AddUniversityToSelectionProcess < ActiveRecord::Migration
  def change
    add_reference :selection_processes, :university, index: true, foreign_key: true
  end
end
