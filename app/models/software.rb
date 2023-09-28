class Software < ApplicationRecord
  has_and_belongs_to_many :employees

  def compliant?
    license_count > employees.count
  end
end
