class RenameThings < ActiveRecord::Migration[5.2]
  def change
    rename_column :contracts, :endDate, :end_date
    rename_column :contracts, :startDate, :start_date
  end
end
