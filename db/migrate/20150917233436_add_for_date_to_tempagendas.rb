class AddForDateToTempagendas < ActiveRecord::Migration
  def change
    add_column :tempagendas, :for_date, :date, null: false
  end
end
