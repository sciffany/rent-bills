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
#  status     :integer
#

class Contract < ApplicationRecord
  belongs_to :unit
  belongs_to :tenant
  has_many :dues, dependent: :destroy

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :charge, presence: true

  enum status: %i[upcoming active expired]

  validate :end_after_start

  def end_after_start
    if end_date && start_date && end_date <= start_date
      errors.add(:end_date, 'must be after start date')
    end
  end

  def update_status
    if start_date > Time.now
      update(status: :upcoming)
    elsif end_date < Time.now
      update(status: :expired)
    else
      update(status: :active)
    end
  end

  def self.contract_status
    all.each do |c|
      if c.start_date > Time.now
        c.update(status: :upcoming)
      elsif c.end_date < Time.now
        c.update(status: :expired)
      else
        c.update(status: :active)
      end
    end
  end

  # def self.clear_dateless
  #   dateless = all.where(charge: nil)
  #   dateless.each{|double| double.destroy}
  # end
  # Contract.clear_dateless
end
