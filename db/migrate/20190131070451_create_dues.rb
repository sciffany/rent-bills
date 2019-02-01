# frozen_string_literal: true

class CreateDues < ActiveRecord::Migration[5.2]
  def change
    create_table :dues do |t|
      t.date :due_date
      t.references :contract, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
