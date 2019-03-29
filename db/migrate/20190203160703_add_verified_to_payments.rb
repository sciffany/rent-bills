# frozen_string_literal: true

class AddVerifiedToPayments < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :verified, :boolean
  end
end
