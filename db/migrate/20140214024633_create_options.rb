class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.belongs_to :question, index: true
      t.text :description, null: false

      t.timestamps
    end
  end
end
