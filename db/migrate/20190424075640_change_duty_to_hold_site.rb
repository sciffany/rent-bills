class ChangeDutyToHoldSite < ActiveRecord::Migration[5.2]
  def change
    rename_column :duties, :location_id, :site_id
  end
end
