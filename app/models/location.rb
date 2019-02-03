# frozen_string_literal: true

# == Schema Information
#
# Table name: locations
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  password   :string
#

class Location < ApplicationRecord
  has_many :duties, dependent: destroy
  has_many :tenants, dependent: :destroy
  has_many :units, dependent: :destroy
end
