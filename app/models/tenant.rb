# frozen_string_literal: true

# == Schema Information
#
# Table name: tenants
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  balance    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tenant < ApplicationRecord
  belongs_to :location
  has_many :contracts, dependent: :destroy
end
