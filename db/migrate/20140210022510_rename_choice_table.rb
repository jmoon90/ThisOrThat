class RenameChoiceTable < ActiveRecord::Migration
  def change
    rename_table(:choices, :questions)
  end
end
