class MakeDutyBelongToUser < ActiveRecord::Migration[5.2]
  def change
    rename_column :duties, :keeper_id, :user_id
  end
end
