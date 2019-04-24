class ChangeDutyToHoldLocation < ActiveRecord::Migration[5.2]
  def change
    rename_column :duties, :site_id, :location_id
  end
end
