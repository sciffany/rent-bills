# frozen_string_literal: true
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
#  automatic   :boolean
#

class Due < ApplicationRecord
  belongs_to :contract
end
