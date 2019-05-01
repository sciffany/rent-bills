# frozen_string_literal: true

# == Schema Information
#
# Table name: tenants
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  balance     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  location_id :bigint(8)
#

class Tenant < ApplicationRecord
  belongs_to :location
  has_many :contracts, dependent: :destroy
  has_many :units, through: :contracts
  validates :name, presence: true, uniqueness: { scope: :location }
  has_many :payments, dependent: :destroy
  has_many :dues, through: :contracts, dependent: :destroy

  def balance
    p = payments.order(id: :asc)
    d = dues.where('due_date<?', Time.now + 1.month)
    p.where(status: :accepted).sum(:amount) +
      p.where(status: :unverified).sum(:amount) -
      d.sum(:amount)
  end
end
