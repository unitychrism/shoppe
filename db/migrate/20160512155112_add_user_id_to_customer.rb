class AddUserIdToCustomer < ActiveRecord::Migration
  def change
  	unless column_exists? :shoppe_customers, :user_id
      add_column :shoppe_customers, :user_id, :integer
    end
  end
end
