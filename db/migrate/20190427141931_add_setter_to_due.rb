# frozen_string_literal: true

class AddSetterToDue < ActiveRecord::Migration[5.2]
  def change
    add_reference :dues, :user, foreign_key: true
  end
end
