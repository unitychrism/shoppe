module Shoppe
  class ProductLocation < ActiveRecord::Base
    self.table_name = 'shoppe_product_locations'

    # Links back
    belongs_to :product, class_name: 'Shoppe::Product'
    belongs_to :location, class_name: 'Shoppe::Location'

    # Validations
   	validates_presence_of :product, :location

   	def name
   	  Shoppe::Location.find(location).name
   	end

    # Is this product currently in stock at this location?
    #
    # @return [Boolean]
    def in_stock?
      stock
    end

   	scope :ordered, -> { order(location_id: :asc) }
  end
end
