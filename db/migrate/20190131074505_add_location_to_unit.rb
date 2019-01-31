class AddLocationToUnit < ActiveRecord::Migration[5.2]
  def change
    add_reference :units, :location, foreign_key: true
  end
end
