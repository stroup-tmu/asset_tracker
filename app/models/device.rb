class Device < ApplicationRecord
  belongs_to :manufacturer
  belongs_to :category
  belongs_to :employee, :optional => true

end
