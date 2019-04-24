class UpdateVerifiedDuty < ActiveRecord::Migration[5.2]
  def change
    Duty.all.each do |d|
      d.update_attributes(verified: d.location.user==d.user)
    end
  end
end
