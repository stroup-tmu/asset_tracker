class Employee < ApplicationRecord
  has_many :devices
  has_many :manufacturers, :through => :devices

end
