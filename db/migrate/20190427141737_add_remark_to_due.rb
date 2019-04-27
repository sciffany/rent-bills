class AddRemarkToDue < ActiveRecord::Migration[5.2]
  def change
    add_column :dues, :remark, :string
  end
end
