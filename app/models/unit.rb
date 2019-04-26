# frozen_string_literal: true

# == Schema Information
#
# Table name: units
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  price       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  location_id :bigint(8)
#

class Unit < ApplicationRecord
  belongs_to :location
  has_many :contracts, dependent: :destroy
  has_many :tenants, through: :contracts
  validates :name, presence: true, uniqueness: { scope: :location }
  validates :price, presence: true
end
