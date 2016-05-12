class AddLocationIdAndTypeToUser < ActiveRecord::Migration
  def change
  	unless column_exists? :shoppe_users, :location_id
      add_column :shoppe_users, :location_id, :integer
    end

    unless column_exists? :shoppe_users, :user_type
      add_column :shoppe_users, :user_type, :string
    end
  end
end
