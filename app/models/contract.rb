# frozen_string_literal: true

# == Schema Information
#
# Table name: contracts
#
#  id         :bigint(8)        not null, primary key
#  start_date :date
#  end_date   :date
#  charge     :integer
#  comment    :string
#  schedule   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tenant_id  :bigint(8)
#  unit_id    :bigint(8)
#

class Contract < ApplicationRecord
  belongs_to :unit
  belongs_to :tenant

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :charge, presence: true

  validates :end_after_start

  def end_after_start
    if end_date && start_date && end_date<=start_date
      errors.add(:end_date, "must be after start date")
    end
  end

  def self.clear_dateless
    dateless = all.where(charge: nil)
    dateless.each{|double| double.destroy}
  end
  Contract.clear_dateless
end
