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

require 'rails_helper'

RSpec.describe Location, type: :model do
end
