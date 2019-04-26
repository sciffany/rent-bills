# frozen_string_literal: true

# == Schema Information
#
# Table name: duties
#
#  id          :bigint(8)        not null, primary key
#  start_date  :date
#  end_date    :date
#  keeper_id   :bigint(8)
#  location_id :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Duty < ApplicationRecord
  belongs_to :user
  belongs_to :location
  validates :location, uniqueness: { scope: :user }

  validate :has_dates_if_temp
  validate :end_after_start

  def has_dates_if_temp
    if (!end_date || !start_date) && verified && user.keeper?
      errors.add(:start_date, 'or end date is missing')
    end
  end

  def end_after_start
    if end_date && start_date && end_date <= start_date
      errors.add(:end_date, 'must be after start date')
    end
  end

  # https://stackoverflow.com/questions/14124212/remove-duplicate-records-based-on-multiple-columns?answertab=votes#tab-top
  def self.dedupe
    # find all models and group them on keys which should be common
    grouped = all.group_by { |duty| [duty.user, duty.location] }
    grouped.values.each do |duplicates|
      # the first one we want to keep right?
      first_one = duplicates.shift # or pop for last one
      # if there are any more left, they are duplicates
      # so delete all of them
      duplicates.each(&:destroy) # duplicates can now be destroyed
    end
  end

  Duty.dedupe

  def self.clear_dateless
    dateless = all.where(start_date: nil)
    dateless.each(&:destroy)
  end
  Duty.clear_dateless
end
