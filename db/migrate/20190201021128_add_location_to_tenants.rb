# frozen_string_literal: true

class AddLocationToTenants < ActiveRecord::Migration[5.2]
  def change
    add_reference :tenants, :location, foreign_key: true
  end
end
