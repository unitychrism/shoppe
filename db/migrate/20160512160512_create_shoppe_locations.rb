class CreateShoppeLocations < ActiveRecord::Migration
  def change
    create_table :shoppe_locations do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :address4
      t.string :postcode
      t.integer :country

      t.timestamps
    end
  end
end
