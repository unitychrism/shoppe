class AddStockToProductLocations < ActiveRecord::Migration
  def change
  	unless column_exists? :shoppe_product_locations, :stock
      add_column :shoppe_product_locations, :stock, :integer
    end
  end
end
