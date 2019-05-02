# frozen_string_literal: true

# == Schema Information
#
# Table name: duties
#
#  id          :bigint(8)        not null, primary key
#  start_date  :date
#  end_date    :date
#  user_id     :bigint(8)
#  location_id :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  verified    :boolean          default(FALSE)
#

require 'rails_helper'

RSpec.describe Duty, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:location) }
  
end
