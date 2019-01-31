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
#

require 'rails_helper'

RSpec.describe Duty, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
