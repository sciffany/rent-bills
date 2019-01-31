class Payment < ApplicationRecord
  belongs_to :tenant
  belongs_to :user
  
end
