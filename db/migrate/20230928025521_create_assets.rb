class CreateAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :assets do |t|
      t.string :name
      t.references :asset_type, null: false, foreign_key: true
      t.references :manufacturer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
