class AddManufacturerToProduct < ActiveRecord::Migration
  def change
  	unless column_exists? :shoppe_products, :manufacturer_id
      add_column :shoppe_products, :manufacturer_id, :integer
    end
  end
end
