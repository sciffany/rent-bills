# frozen_string_literal: true

class CreateTenants < ActiveRecord::Migration[5.2]
  def change
    create_table :tenants do |t|
      t.string :name
      t.integer :balance

      t.timestamps
    end
  end
end
