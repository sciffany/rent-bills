# frozen_string_literal: true

class CreateContracts < ActiveRecord::Migration[5.2]
  def change
    create_table :contracts do |t|
      t.date :start_date
      t.date :end_date
      t.references :location, foreign_key: true
      t.integer :charge
      t.string :comment
      t.integer :schedule

      t.timestamps
    end
  end
end
