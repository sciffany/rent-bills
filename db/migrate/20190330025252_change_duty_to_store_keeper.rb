class ChangeDutyToStoreKeeper < ActiveRecord::Migration[5.2]
  def change
	rename_column :duties, :user_id, :keeper_id
  end
end
