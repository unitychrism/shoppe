class CreateShoppeProductLocations < ActiveRecord::Migration
  def change
	create_table 'shoppe_product_locations', force: true do |t|
	  t.integer 'product_id', null: false
	  t.integer 'location_id', null: false
	end
  end
end
