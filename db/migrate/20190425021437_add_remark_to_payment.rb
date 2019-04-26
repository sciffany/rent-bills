# frozen_string_literal: true

class AddRemarkToPayment < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :remark, :string, default: ''
  end
end
