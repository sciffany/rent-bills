# frozen_string_literal: true

class AddStatusToContract < ActiveRecord::Migration[5.2]
  def change
    add_column :contracts, :status, :integer
  end
end
