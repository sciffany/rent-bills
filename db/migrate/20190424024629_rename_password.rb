# frozen_string_literal: true

class RenamePassword < ActiveRecord::Migration[5.2]
  def change
    rename_column :locations, :password, :password_digest
  end
end
