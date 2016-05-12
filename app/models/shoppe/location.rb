module Shoppe
  class Location < ActiveRecord::Base
    self.table_name = 'shoppe_locations'

    # Validations
    validates :name, presence: true
    validates :address1, presence: true

    scope :ordered, -> { order(name: :asc) }
  end
end
