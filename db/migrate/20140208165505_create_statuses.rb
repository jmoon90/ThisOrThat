class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.boolean :approved, default: false
      t.boolean :pending, default: true
      t.references :choice, index: true

      t.timestamps
    end
  end
end
