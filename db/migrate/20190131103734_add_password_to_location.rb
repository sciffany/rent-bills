# frozen_string_literal: true

class AddPasswordToLocation < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :password, :string
  end
end
