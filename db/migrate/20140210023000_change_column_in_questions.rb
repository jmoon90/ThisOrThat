class ChangeColumnInQuestions < ActiveRecord::Migration
  def up
    remove_column(:questions, :choice1)
    remove_column(:questions, :choice2)
    add_column(:questions, :description, :text, null: false, default: "ThisOrThat")
  end
  def down
    add_column(:questions, :choice1, :string)
    add_column(:questions, :choice2, :string)
    remove_column(:questions, :description)
  end
end
