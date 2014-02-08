class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.text :choice1, null: false
      t.text :choice2, null: false

      t.timestamps
    end
  end
end
