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
#  status     :integer
#

require 'rails_helper'

RSpec.describe Contract, type: :model do
    it { should belong_to(:unit) }
    it { should belong_to(:tenant) }
    it { should have_many(:dues).dependent(:destroy) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
    it { should validate_presence_of(:charge) }

  it 'rejects start year not right after end year' do
    expect(build(:contract, start_date: 04/01/2000, end_date: 04/01/1999, amount: 1000)).to_not be_valid
  end

end
