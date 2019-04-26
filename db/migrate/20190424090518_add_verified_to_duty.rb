# frozen_string_literal: true

class AddVerifiedToDuty < ActiveRecord::Migration[5.2]
  def change
    add_column :duties, :verified, :boolean, default: false
  end
end
