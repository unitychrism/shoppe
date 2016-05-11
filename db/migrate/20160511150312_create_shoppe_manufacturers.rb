class CreateShoppeManufacturers < ActiveRecord::Migration
  def change
    create_table :shoppe_manufacturers do |t|
      t.string :name

      t.timestamps
    end
  end
end
