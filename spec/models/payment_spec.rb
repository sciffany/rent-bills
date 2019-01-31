# == Schema Information
#
# Table name: payments
#
#  id         :bigint(8)        not null, primary key
#  pay_date   :date
#  amount     :integer
#  tenant_id  :bigint(8)
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Payment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
