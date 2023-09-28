class Employee < ApplicationRecord
  has_many :devices
  has_many :manufacturers, :through => :devices

  def full_name
    [first_name, last_name].join(" ")
  end
end
