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

require 'rails_helper'

RSpec.describe Unit, type: :model do
end
