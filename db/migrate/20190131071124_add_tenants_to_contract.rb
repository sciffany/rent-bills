class AddTenantsToContract < ActiveRecord::Migration[5.2]
  def change
    add_reference :contracts, :tenant, foreign_key: true
  end
end
