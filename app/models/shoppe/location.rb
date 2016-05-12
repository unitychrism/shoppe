module Shoppe
  class Location < ActiveRecord::Base
    # User types
    TYPES = %w(customer locationmanager admin).freeze

    self.table_name = 'shoppe_locations'

    # Validations
    validates :name, presence: true
    validates :address1, presence: true

    belongs_to :user, class_name: 'Shoppe::User'

    belongs_to :product, class_name: 'Shoppe::Product'

    scope :ordered, -> { order(name: :asc) }
  end
end
