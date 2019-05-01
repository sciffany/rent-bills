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

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should have_secure_password }
  it { should have_many(:duties) }
  it { should have_many(:properties) }
  it { should have_many(:sites) }
  it { should have_many(:watchedDuties) }
end
