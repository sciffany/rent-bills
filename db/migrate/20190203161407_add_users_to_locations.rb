# frozen_string_literal: true

class AddUsersToLocations < ActiveRecord::Migration[5.2]
  def change
    add_reference :locations, :user, foreign_key: true
  end
end
