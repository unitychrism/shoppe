class CreateShoppeVendors < ActiveRecord::Migration
  def change
    create_table :shoppe_vendors do |t|
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :email
      t.string :phone
      t.string :mobile

      t.timestamps
    end
  end
end
