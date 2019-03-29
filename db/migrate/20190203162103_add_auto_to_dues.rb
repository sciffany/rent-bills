# frozen_string_literal: true

class AddAutoToDues < ActiveRecord::Migration[5.2]
  def change
    add_column :dues, :automatic, :boolean
  end
end
