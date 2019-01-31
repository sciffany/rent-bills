# == Schema Information
#
# Table name: dues
#
#  id          :bigint(8)        not null, primary key
#  due_date    :date
#  contract_id :bigint(8)
#  amount      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Due, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
