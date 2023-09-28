class Employee < ApplicationRecord
  has_many :devices
  has_many :manufacturers, :through => :devices
  has_and_belongs_to_many :softwares

  def full_name
    [first_name, last_name].join(" ")
  end
end
