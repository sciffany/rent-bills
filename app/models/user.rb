# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  name            :string
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  role            :integer
#

class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true,
                    uniqueness: true
  has_secure_password

  has_many :locations

  enum role: %i[keeper owner]
end
