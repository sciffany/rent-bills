# frozen_string_literal: true
# == Schema Information
#
# Table name: locations
#
#  id              :bigint(8)        not null, primary key
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  user_id         :bigint(8)
#

class Location < ApplicationRecord
  validates :name, presence: true,
                   uniqueness: true
  has_secure_password
  has_many :duties, dependent: :destroy
  has_many :tenants, dependent: :destroy
  has_many :units, dependent: :destroy
  belongs_to :user

  has_many :payments, through: :tenants, dependent: :destroy
  has_many :contracts, through: :units, dependent: :destroy

  has_many :keepers, class_name: 'User', source: :user, through: :duties
end
