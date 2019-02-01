# frozen_string_literal: true

class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.date :pay_date
      t.integer :amount
      t.references :tenant, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
