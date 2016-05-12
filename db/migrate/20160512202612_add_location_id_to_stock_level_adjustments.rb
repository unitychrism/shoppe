class AddLocationIdToStockLevelAdjustments < ActiveRecord::Migration
  def change
  	unless column_exists? :shoppe_stock_level_adjustments, :location_id
      add_column :shoppe_stock_level_adjustments, :location_id, :integer
    end
  end
end
