# frozen_string_literal: true

# == Schema Information
#
# Table name: payments
#
#  id         :bigint(8)        not null, primary key
#  pay_date   :date
#  amount     :integer
#  tenant_id  :bigint(8)
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  verified   :boolean
#

class Payment < ApplicationRecord
  belongs_to :tenant
  belongs_to :user

  validates :amount, presence: true
  validates :pay_date, presence: true

  
end
