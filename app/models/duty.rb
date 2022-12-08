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
  validates :location_id, uniqueness: { scope: :user }

  validate :has_dates_or_unverified_or_owner

  def has_dates_or_unverified_or_owner
    errors.add(:start_date, 'is missing') unless
      start_date || !verified || user.owner?
  end
end
