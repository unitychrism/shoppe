class AddVendorToProduct < ActiveRecord::Migration
  def change
  	unless column_exists? :shoppe_products, :vendor_id
      add_column :shoppe_products, :vendor_id, :integer
    end
  end
end
