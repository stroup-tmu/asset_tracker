class CreateJoinTableAssetsEmployees < ActiveRecord::Migration[7.0]
  def change
    create_join_table :assets, :employees do |t|
      # t.index [:asset_id, :employee_id]
      # t.index [:employee_id, :asset_id]
    end
  end
end
