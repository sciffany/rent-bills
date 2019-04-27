class ChangePaymentVerificationToStatus < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :status, :integer
    remove_column :payments, :verified
  end
end
