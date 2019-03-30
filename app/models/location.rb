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
#  user_id    :bigint(8)
#

class Location < ApplicationRecord

  validates :name, presence: true,
                  uniqueness: true
  has_many :duties
  has_many :tenants
  has_many :units
  belongs_to :user

  has_many :keepers, class_name: "User", through: :duties
end
