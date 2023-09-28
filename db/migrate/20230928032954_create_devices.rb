class CreateDevices < ActiveRecord::Migration[7.0]
  def change
    create_table :devices do |t|
      t.string :name
      t.references :manufacturer, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
