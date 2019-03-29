# frozen_string_literal: true
# == Schema Information
#
# Table name: tenants
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  balance     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  location_id :bigint(8)
#

require 'rails_helper'

RSpec.describe Tenant, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
