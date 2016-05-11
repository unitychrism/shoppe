module Shoppe
  class Manufacturer < ActiveRecord::Base

    self.table_name = "shoppe_manufacturers"

    # Vendor products
    has_many :products, dependent: :restrict_with_exception, class_name: 'Shoppe::Product'

    # Validations
    validates :name, presence: true, uniqueness: true

    # All vendors ordered by their ID desending
    scope :ordered, -> { order(id: :desc)}

    def self.ransackable_attributes(auth_object = nil)
      ['name'] + _ransackers.keys
    end

    def self.ransackable_associations(auth_object = nil)
      []
    end

  end
end
