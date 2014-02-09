class AddUserColumnToChoices < ActiveRecord::Migration
  def change
    add_reference :choices, :user, index: true, null: false, default: 0
  end
end
