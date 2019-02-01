# frozen_string_literal: true

# == Schema Information
#
# Table name: contracts
#
#  id         :bigint(8)        not null, primary key
#  start_date :date
#  end_date   :date
#  charge     :integer
#  comment    :string
#  schedule   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tenant_id  :bigint(8)
#  unit_id    :bigint(8)
#

require 'rails_helper'

RSpec.describe Contract, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
