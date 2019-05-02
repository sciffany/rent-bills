# frozen_string_literal: true

# == Schema Information
#
# Table name: duties
#
#  id          :bigint(8)        not null, primary key
#  start_date  :date
#  end_date    :date
#  user_id     :bigint(8)
#  location_id :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  verified    :boolean          default(FALSE)
#

class Duty < ApplicationRecord
  belongs_to :user
  belongs_to :location
  validates :location, uniqueness: { scope: :user }

  validate :has_dates_or_unverified_or_owner
  validate :end_after_start

  def has_dates_or_unverified_or_owner
    errors.add(:start_date, 'or end date is missing') unless
      end_date && start_date || !verified || user.owner
  end

  def end_after_start
    if end_date && start_date && end_date <= start_date
      errors.add(:end_date, 'must be after start date')
    end
  end
end
