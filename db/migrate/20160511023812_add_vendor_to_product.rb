class AddVendorToProduct < ActiveRecord::Migration
  def change
    add_column :shoppe_products, :vendor_id, :integer
  end
end
