class AddLocationIdToOrder < ActiveRecord::Migration
  def change
  	unless column_exists? :shoppe_orders, :location_id
      add_column :shoppe_orders, :location_id, :integer
    end
  end
end
