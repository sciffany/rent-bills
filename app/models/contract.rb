class Contract < ApplicationRecord
  belongs_to :unit
  belongs_to :tenant
end
