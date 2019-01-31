class MakeContractBelongToUnit < ActiveRecord::Migration[5.2]
  def change
    add_reference :contracts, :unit, foreign_key: true
    remove_reference :contracts, :location, foreign_key: true
  end
end
