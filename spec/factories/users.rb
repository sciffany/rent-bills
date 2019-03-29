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

# FactoryBot.define do
#   factory :user do
#     email 'jordan@gmail.com'
#     name 'Jordan'
#   end
# end
