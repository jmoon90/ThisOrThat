class ChangeStatusColumn < ActiveRecord::Migration
  def change
    rename_column(:statuses, :choice_id, :question_id)
  end
end
